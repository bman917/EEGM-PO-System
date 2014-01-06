require 'test_helper'

class ContactTest < ActiveSupport::TestCase
   test "Create Contact With Phone" do
   	 Contact.delete_all
   	 Phone.delete_all

   	 juan = Contact.new(name: "Juan Dela Cruz")
   	 phone = Phone.new(number: "123456789")
   	 juan.phones << phone
   	 juan.save!

   	 assert (Phone.all.length == 1) 
	 assert (Contact.first.phones.length == 1)

	 juan.phones.create(number: "987654321")
	 juan.save!

	 assert (Contact.first.phones.length == 2)	 
   end
end
