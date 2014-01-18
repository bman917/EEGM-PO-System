class PurchaseItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @purchase_item = PurchaseItem.new(purchase_items_params)
    @purchase_item.save
    @purchase_item.purchase_order.reload
  end

  def destroy
    @purchase_item = PurchaseItem.find(params[:id])
    @purchase_item.destroy
    @purchase_order = @purchase_item.purchase_order
    @purchase_order.reload
  end


  def update
  end

  def purchase_items_params
    params.require(:purchase_item).permit(:item_name, :quantity, :unit, :price, :total, :note, :purchase_order_id)
  end
end
