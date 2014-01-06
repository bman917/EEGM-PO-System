class SupplierItemsController < ApplicationController
  before_action :set_supplier_item, only: [:show, :edit, :update, :destroy]

  # GET /supplier_items
  # GET /supplier_items.json
  def index
    @supplier_items = SupplierItem.all
  end

  # GET /supplier_items/1
  # GET /supplier_items/1.json
  def show
  end

  # GET /supplier_items/new
  def new
    @supplier_item = SupplierItem.new
  end

  # GET /supplier_items/1/edit
  def edit
  end

  # POST /supplier_items
  # POST /supplier_items.json
  def create
    @supplier_item = SupplierItem.new(supplier_item_params)

    respond_to do |format|
      if @supplier_item.save
        format.html { redirect_to @supplier_item, notice: 'Supplier item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supplier_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @supplier_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplier_items/1
  # PATCH/PUT /supplier_items/1.json
  def update
    respond_to do |format|
      if @supplier_item.update(supplier_item_params)
        format.html { redirect_to @supplier_item, notice: 'Supplier item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supplier_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_items/1
  # DELETE /supplier_items/1.json
  def destroy
    @supplier_item.destroy
    respond_to do |format|
      format.html { redirect_to supplier_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_item
      @supplier_item = SupplierItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_item_params
      params.require(:supplier_item).permit(:supplier_id, :item_id, :price, :note)
    end
end
