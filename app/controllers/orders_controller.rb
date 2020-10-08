class OrdersController < ApplicationController

  before_action :set_order, only: [ :show ]

  def show
    @user = current_user
  end

  def new 
    @user = current_user
    @order = Order.new
    @tables = Table.all
    @dishes = Dish.all
  end

  # input:
  # params = {
  #   order: {name: "order 1"},
  #   table_id: 1,
  #   dishes: [
  #     { dish_id: 1, quantity: 2 },
  #     { dish_id: 2, quantity: 3 }
  #   ]
  # }

def validate_step
  oder = Order.new oder_params
  oder.valid?

  error_messages = error_attrs.map do |attr|
    Order.human_attribute_name(attr) + " " + oder.errors[attr].first
  end
end

    def create
      @user = current_user 
      if CreateOrderAndOrderDetails.new(params,current_user).perform
        flash[:success] = "Create Order"
        redirect_to root_path
      else 
        flash[:danger] = "Register failed"
        redirect_to root_path
      end
    end
  end

  def edit
    @user = current_user
  end


    def update
      @user = current_user
      if @order.update(order_params)
        flash[:success] = "Order was successfully updated."
        redirect_to orders_url
      else
        flash[:danger] = "Order was not successfully updated."
        render 'edit'
      end

    end


    def destroy
      @order.destroy
      flash[:success] = "Menu was successfully destroyed."
      redirect_to orders_url
    end
    private
    def set_order
        @order = Order.find(params[:id])
    end