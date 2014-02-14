class Notifier < ActionMailer::Base
  default :from => 'seeds@karmagrove.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail(
      :to => @user.email,
      :subject => 'Thanks for signing up Karma Grove.  We will email you monthly with updates as to where donations have gone as well as keep you up to date on any new features.'
    )
  end
end
