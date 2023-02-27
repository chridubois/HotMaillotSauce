class JerseysController < ApplicationController
  before_action :edit

  def edit
  end

  def update
    @jersey = Jersey.find(params[:id])
    @jersey.update(params[:jersey])
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
    params.require('jersey').permit(:team, :player, :year, :state, :description, :photo, :number, :price_per_day, :user,
      :seller_address)
  end
end
