class PurchaseOrdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @po_status = params[:status] || 'PENDING'

    if @po_status == 'ALL'
      @purchase_orders = PurchaseOrder.all.order(po_date: :desc)
    else
      @purchase_orders = PurchaseOrder.where(status: @po_status).order(po_date: :desc)
    end

    @new_purchase_order = PurchaseOrder.new
    @new_purchase_order.po_date = Date.today
    @new_purchase_order.status = 'PENDING'

  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
    @item_delivery = ItemDelivery.new
    @item_delivery.purchase_order = @purchase_order
    @item_delivery.date_recieved = Date.today

    @new_purchase_order_contact = PurchaseOrderContact.new(purchase_order: @purchase_order)
    @new_phone = Phone.new(contact_detail_type: @purchase_order.class, contact_detail_id: @purchase_order.id)

    @new_purchase_item = PurchaseItem.new(purchase_order: @purchase_order)


  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.purchase_order_contacts.build
    @purchase_order.phones.build
    @purchase_order.purchase_items.build
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @purchase_order.username = current_user.username

    #Copy Contact Details from last purchase order
    unless purchase_order_params[:purchase_order_contact]
      supplier = Supplier.find_by(name: purchase_order_params[:supplier_name])
      if supplier
        similar_pos = PurchaseOrder.where(supplier: supplier).last

        if similar_pos
          similar_pos.purchase_order_contacts.each do | c |
            @purchase_order.purchase_order_contacts.build name: c.name
          end
          similar_pos.phones.each do | p |
            @purchase_order.phones.build number: p.number
          end
        end
      end
    end

    respond_to do |format|
      if @purchase_order.save
        @purchase_order.record_activity(:create, current_user, "Created PO")
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @purchase_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)

        @purchase_order.record_update(current_user, purchase_order_params)
        
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.record_activity(:delete, current_user, "Deleted PO")
    @purchase_order.destroy
    respond_to do |format|

      format.html { redirect_to purchase_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:status, :username, :po_date, :supplier_id, :notes, :supplier_name, :grand_total_formatted,
        phones_attributes: [:id, :number, :_destroy], 
        purchase_order_contacts_attributes: [:id, :name, :_destroy],
        purchase_items_attributes: 
          [:id, :item_name, :price, :quantity, :unit, :total, :note, :_destroy])
    end
end
