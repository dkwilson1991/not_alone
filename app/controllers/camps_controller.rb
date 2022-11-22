class CampsController < ApplicationController
  def show
    @camp = Camp.find(params[:id])
    authorize @camp
  end
  def index
    @camps = policy_scope(Camp)
  end
  def edit
    @camp = Camp.find(params[:id])
    authorize @camp
  end
  def create
    @camp = Camp.new(camp_params)
    @camp.user = current_user
    authorize @camp
  end
  def update
    authorize @camp
  end
  private
  def camp_params
    params.require(:camp).permit(:camp_name)
  end
end












