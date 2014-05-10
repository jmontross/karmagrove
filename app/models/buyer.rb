class Buyer < User


  def self.create(email)
    if @this = self.create!(:email => email, :password => "foobarawesome#{rand(5)}", :email_subscriber => true)
      return @this, "success"
    end
  end

  def self.update(id,email)
    # puts "email sanity check #{email}"
    # TODO - generate a crazy long werid passsword.. and send them a welcome
    # email as well as a means of logging in to see purchases associated with their email
    # maybe just allow anyone's email to be searched and see purchase... transparency!

    if @this = self.find(id)
      @this.email = email
      @this.save
      return @this, "success"
    end
  end
end
