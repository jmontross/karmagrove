class UsersController < InheritedResources::Base


  def email_subscribe
    return "fail" unless params[:email]
    return EmailSubscriber.subscribe params[:email]
  end



end
