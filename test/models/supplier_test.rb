require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "Create Supplier With Phone" do
   	 Supplier.delete_all
   	 Phone.delete_all

   	 greko = Supplier.new(name: "Greko")
   	 phone = Phone.new(number: "123456789")
   	 greko.phones << phone
   	 greko.save!

   	 assert (Phone.all.length == 1) 
	 assert (Supplier.first.phones.length == 1)

	 greko.phones.create(number: "987654321")
	 greko.save!

	 assert (Supplier.first.phones.length == 2)	 
  end
end
