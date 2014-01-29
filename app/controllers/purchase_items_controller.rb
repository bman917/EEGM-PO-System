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
    @purchase_item = set_purchase_item
    @purchase_item.destroy
    @purchase_order = @purchase_item.purchase_order
    @purchase_order.reload
  end

  def update
    @purchase_item = set_purchase_item
    respond_to do |format|
      if @purchase_item.update(purchase_items_params)
        format.html { redirect_to @purchase_order, notice: 'Purchase Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_purchase_item
    @purchase_item = PurchaseItem.find(params[:id])
  end

  def purchase_items_params
    params.require(:purchase_item).permit(:item_name, :quantity, :unit, :price, :total, :note, :purchase_order_id)
  end
end
