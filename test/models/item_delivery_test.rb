require 'test_helper'

class ItemDeliveryTest < ActiveSupport::TestCase
  test "find by name is not case sensitive" do
     Item.create(name: 'Coke')
     id = ItemDelivery.new(item_name: 'coke')
     id.save!
  end
end
