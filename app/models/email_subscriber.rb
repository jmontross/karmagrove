class EmailSubscriber < User

  # TODO: Put fancy validation so we can do EmailSubscriber.new("email@foo.com")
  # vaidates :presence_of :EmailSubscriber
  def self.subscribe(email)
    puts "email sanity check #{email}"
    # TODO - generate a crazy long werid passsword.. and send them a welcome
    # email as well as a means of logging in to see purchases associated with their email
    # maybe just allow anyone's email to be searched and see purchase... transparency!
    if self.create!(:email => email, :password => "foobarawesome#{rand(5)}")
      return "success"
    end
  end
end
