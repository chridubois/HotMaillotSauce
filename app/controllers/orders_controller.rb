class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update]
  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
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
