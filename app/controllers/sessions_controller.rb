class SessionsController < ApplicationController
  def setup_oauth(donation_id="")
    callback_url = "http://karmagrove.com/auth/facebook/callback"

    @oauth = Koala::Facebook::OAuth.new("402764733175875", "b91c8b29bf5295730b4d8100f76ded1d", callback_url)
    @url_for_facebook = @oauth.url_for_oauth_code(:state=>donation_id)
  end

  def create
    # P_ID=402764733175875;
    # export FACEBOOK_SECRET=b91c8b29bf5295730b4d8100f76ded1d;

    # generate authenticating URL
    setup_oauth
    @code = params[:code]
    Rails.logger.info "code : #{params[:code]}"
    if @code
      Rails.logger.info("@code : #{@code}")
      Rails.logger.info("made it through the if statement!")
      # fetch the access token once you have the code
      # callback_url = "http://localhost:3000/auth/facebook/callback"
      # @oauth = Koala::Facebook::OAuth.new("402764733175875", "b91c8b29bf5295730b4d8100f76ded1d", callback_url)
      # Rails.logger.info @oauth
      # # # code = session['callback_code']
      # Rails.logger.info("code : #{code}")

      @token = @oauth.get_access_token(@code)

      @rest = Koala::Facebook::API.new(@token)

      # graph = Koala::Facebook::GraphAPI.new(access_token)

      # @graph = Koala::Facebook::API.new(oauth_access_token)

      @profile = @rest.get_object("me")
      @profile_path = @rest.get_picture(@profile['id'],:type => "large")
      @name_pic = @rest.fql_query("select uid, name, pic_square from user where uid in (select uid2 from friend where uid1 = me())")
      Rails.logger.info @name_pic

      # @rest.fql_query(my_fql_query) # convenience method

      # @rest.fql_multiquery(fql_query_hash) # convenience method
      # @rest.rest_call("stream.publish", arguments_hash) # generic version


      Rails.logger.info " @token #{@token}"
      if params[:state]
        @purchase = Purchase.find params[:state]
        @user = User.find_or_create_by_facebook_id @profile['id']
        @purchase.buyer_id = @user.id
        @purchase.save
        @product = Product.find @purchase.product_id
        @purchases = Purchase.where(:buyer_id => @user.id)
      end
    end


    # unless params[:code]
    #   redirect_to code
    # else
    #   code = @oauth.get_access_token(code)
    # end
    # Rails.logger.info @oauth.get_access_token(code)
    # @oauth.get_user_info_from_cookies(cookies)
    # Rails.logger.info @oauth.get_user_info_from_cookies(cookies)
    # Rails.logger.info @oauth
    # # user = User.from_omniauth(env["omniauth.auth"])
    # Rails.logger.info user.inspect
    # session[:user_id] = user.id
    # redirect_to root_url
  end

  def login
    setup_oauth(params[:donation_id])
    Rails.logger.info @url_for_facebook
    redirect_to @url_for_facebook
  end
end