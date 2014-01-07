class PurchaseOrderContact < ActiveRecord::Base
  belongs_to :purchase_order
end
