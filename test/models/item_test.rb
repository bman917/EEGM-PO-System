require 'test_helper'

class ItemTest < ActiveSupport::TestCase
   test "Associating Item with Two Suppliers" do
   	 item1 = items(:one)

   	 greko = suppliers(:greko)
   	 mrc = suppliers(:mrc)

   	 greko.supplier_items.create(item: item1)
   	 mrc.supplier_items.create(item: item1)

   	 item1.reload
   	 item1.suppliers.each {|supplier| puts supplier.name}

   	 item2 = items(:two)

   	 greko.items << item2

   	 item2.reload
   	 item2.suppliers.each {|supplier| puts supplier.name}


     assert true
   end
end
