class JerseysController < ApplicationController
  before_action :set_jersey, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @jersey = Jersey.new
  end

  def create
    @jersey = Jersey.new(jersey_params)
    @jersey.user = current_user
    if @jersey.save
      redirect_to jersey_path(@jersey)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if params[:query].present?
      sql_query = "team ILIKE :query OR player ILIKE :query"
      @jerseys = Jersey.where(sql_query, query: "%#{params[:query]}%")
      if @jerseys.count.zero?
        redirect_to no_results_path
      end
    else
      @jerseys = Jersey.order(id: :desc)
    end
  end

  def no_results
  end

  def shop
    @jerseys = Jersey.where(user_id: current_user.id)
  end

  def edit
  end

  def show
    @order = Order.new
    @marker =
      {
        lat: @jersey.user.latitude,
        lng: @jersey.user.longitude
      }
  end

  def update
    @jersey = Jersey.find(params[:id])
    @jersey.update(params[:jersey])
    redirect_to shop_path
  end

  def destroy
    @jersey = Jersey.find(params[:id])
    @jersey.destroy
    redirect_to jerseys_path, status: :see_other
  end

  private

  def set_jersey
    @jersey = Jersey.find(params[:id])
  end

  def jersey_params
    params.require('jersey').permit(:team, :player, :year, :state, :description, :photo, :number, :price_per_day, :user, :size)
  end
end
