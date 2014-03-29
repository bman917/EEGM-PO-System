class ItemDeliveriesController < ApplicationController
  before_action :set_item_delivery, only: [:show, :edit, :update, :destroy]

  # GET /item_deliveries
  # GET /item_deliveries.json
  def index
    @item_deliveries = ItemDelivery.all
  end

  # GET /item_deliveries/1
  # GET /item_deliveries/1.json
  def show
  end

  # GET /item_deliveries/new
  def new
    @item_delivery = ItemDelivery.new
  end

  # GET /item_deliveries/1/edit
  def edit
  end

  # POST /item_deliveries
  # POST /item_deliveries.json
  def create
    @item_delivery = ItemDelivery.new(item_delivery_params)
    @item_name = item_delivery_params[:item_name]
    
    puts "Item name [#{@item_delivery.item_name}], Item: #{@item_delivery.item}"

    respond_to do |format|
      if @item_delivery.save
        @item_delivery.record_activity(:create, current_user, "Add PO Delivery")
        format.html { redirect_to @item_delivery.purchase_order, notice: 'Item delivery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item_delivery }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @item_delivery.errors, status: :unprocessable_entity }
        format.js { render 'error' }
      end
    end
  end

  # PATCH/PUT /item_deliveries/1
  # PATCH/PUT /item_deliveries/1.json
  def update
    respond_to do |format|
      if @item_delivery.update(item_delivery_params)
        @item_delivery.record_activity(:update, current_user, "Updated PO Delivery")
        format.html { redirect_to @item_delivery, notice: 'Item delivery was successfully updated.' }
        format.json { respond_with_bip @item_delivery }
      else
        format.html { render action: 'edit' }
        format.json { respond_with_bip @item_delivery }
      end
    end
  end

  # DELETE /item_deliveries/1
  # DELETE /item_deliveries/1.json
  def destroy
    @item_delivery.record_activity(:delete, current_user, "Deleted PO Delivery")
    po = @item_delivery.purchase_order
    @item_delivery_id = @item_delivery.id
    @item_delivery.destroy
    respond_to do |format|
      format.html { redirect_to purchase_order_path(po) }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_delivery
      @item_delivery = ItemDelivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_delivery_params
      params.require(:item_delivery).permit(:item_id, :item_name, :purchase_order_id, :quantity, :unit, :date_recieved)
    end
end
