class CampsController < ApplicationController
  def show
    @camp = Camp.find(params[:id])
    @assignments = policy_scope(Assignment)
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
    raise
    authorize @camp
    if @camp.save
      redirect_to camp_path(@camp)
    else
      @assignments = policy_scope(Assignment)
      render "assignments/index", status: :unprocessable_entity
    end
  end

  def update
    @camp = Camp.find(params[:id])
    authorize @camp
  end

  private

  def camp_params
    params.require(:camp).permit(:camp_name, :address, :start_date, :end_date, :required_number_volunteers, :required_roles, :description, :director_email, :comments, :newsfeed_post, tag_list: [], photos:[])
  end
end
