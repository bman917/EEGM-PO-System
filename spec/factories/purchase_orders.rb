#NOT USED ATM
FactoryGirl.define do
  factory :purchase_order do
    supplier_name 'JD Food Hall'
  end

  factory :purchase_item do
    item_name 'Coke'
    quantity 5
    unit 'pcs'
    price 20.00
    note 'Ice Cold'
  end
end