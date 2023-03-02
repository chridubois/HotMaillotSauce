class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update]
  def index
    @orders = Order.all
  end

  def show
  end


# test create: action new à suppr !!!
def new
  @jersey = Jersey.find(params[:jersey_id])
  @order = Order.new
end


  def create
    @order = Order.new(order_params)
    @jersey = Jersey.find(params[:jersey_id])
    @order.jersey = @jersey
    @user = current_user.id
    @order.user_id = @user

    @order.total_amount
raise
    if @order.save
      redirect_to orders_path(@order)
    else
      alert
    end
  end

  def edit
  end

  def update
    @order = Order.update(order_params)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require('order').permit(:user, :jersey, :begin_date, :end_date, :total_amount)
  end
end
