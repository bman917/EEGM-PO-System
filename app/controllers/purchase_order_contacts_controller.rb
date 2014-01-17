class PurchaseOrderContactsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @purchase_order_contact = PurchaseOrderContact.new(purchase_order_contact_params)
    unless @purchase_order_contact.save

    end
  end

  def destroy
    @purchase_order_contact = PurchaseOrderContact.find(params[:id])
    @purchase_order_contact_id = @purchase_order_contact.id
    @purchase_order_contact.destroy
  end

  def update
  end

  def purchase_order_contact_params
    params.require(:purchase_order_contact).permit(:purchase_order_id, :name)
  end
end
