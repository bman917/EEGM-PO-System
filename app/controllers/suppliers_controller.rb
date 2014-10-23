class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy, :summary]


  def names
    @suppliers = Supplier.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @suppliers.map(&:name)
  end

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all.order(:name)
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  def summary
    @po_status = params[:po_status] || 'CONFIRMED'

    @purchase_orders = @supplier.purchase_orders
                          .where(status: @po_status)
                          .order(po_date: :desc)
                          .includes(:purchase_items)
                          .paginate(:page => params[:page], :per_page => 2)
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    @supplier.phones.build
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supplier }
      else
        format.html { render action: 'new' }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.includes(:purchase_orders).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :notes,  phones_attributes: [:id, :number, :_destroy])
    end
end
