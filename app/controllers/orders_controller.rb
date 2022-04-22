class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @menus = Menu.all
  end

  # GET /orders/1/edit
  def edit
    @menus = Menu.all
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        total = 0.0
        index = 0
        params[:menus].each do |menu_and_price|

          if menu_and_price == ""
            break
          end

          menu_and_price = menu_and_price.split('_', 2)
          menu_id = menu_and_price[0].to_i
          price = menu_and_price[1].to_i
          menu_qty = params[:menu_qty][index].to_i
          sub_total = price * menu_qty 
          detail_order = @order.menu_orders.create(menu_id: menu_id, quantity: menu_qty, sub_total: sub_total)
          index += 1
          total += detail_order.sub_total
        end
        @order.total = calculate_total(@order)
        @order.save

        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:email)
    end

    # Helper to calculate total
    def calculate_total(order)
      total = 0.0
      order.menu_orders.each do |item|
        total += item.sub_total
      end
      return total
    end
end
