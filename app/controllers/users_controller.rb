class UsersController < InheritedResources::Base


  def email_subscribe
    return "fail" unless params[:email]
    @email = params[:email]
    if User.exists?(:email => params[:email])
      @user = User.find_by_email params[:email]
    else
      @user, @status = EmailSubscriber.subscribe params[:email]
      return @status
    end

  end



end
