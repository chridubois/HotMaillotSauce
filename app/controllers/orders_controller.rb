class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  def index
    @orders = Order.all
  end

  def my_basket
    @orders = current_user.orders
  end

  def show
  end

  def create
    @order = Order.new
    @order.user_id = current_user.id

    @jersey_id = params[:jerseyID].to_i
    @order.jersey_id = @jersey_id

    @order.begin_date = params[:begin_date]
    @order.end_date = params[:end_date]

    @order.total_amount = params[:total_amount]

    if @order.save
      redirect_to profil_path(@order)
    else
      alert
    end
  end


  def edit
  end

  def update
    @order = Order.update(order_params)
  end

  def destroy
    @order.destroy
    redirect_to profil_path, status: :see_other
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require('order').permit(:user, :jersey, :begin_date, :end_date, :total_amount)
  end
end
