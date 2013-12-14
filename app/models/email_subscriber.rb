class EmailSubscriber < User

  validates_presence_of :email
  validates :email, format: { with: /\w+@\w+\.\w{2,3}/ }
  validates :email, uniqueness: true



  # TODO: Put fancy validation so we can do EmailSubscriber.new("email@foo.com")
  # vaidates :presence_of :EmailSubscriber
  def self.subscribe(email)
    # puts "email sanity check #{email}"
    # TODO - generate a crazy long werid passsword.. and send them a welcome
    # email as well as a means of logging in to see purchases associated with their email
    # maybe just allow anyone's email to be searched and see purchase... transparency!
    if @this = self.create!(:email => email, :password => "foobarawesome#{rand(5)}", :email_subscriber => true)
      return @this, "success"
    end
  end
end
