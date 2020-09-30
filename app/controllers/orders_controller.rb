class OrdersController < ApplicationController

  before_action :set_order, only: [ :show ]
  before_action :set_user

  def show
    @user = current_user
  end

  def new
    @user = current_user
    @order = Order.new
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

    def create
      @user = current_user
      if CreateOrderAndOrderDetails.new(params).perform
        flash[:success] = "Create Order"
        redirect_to orders_path
      else 
        flash[:danger] = "Register failed"
        render 'new'
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


