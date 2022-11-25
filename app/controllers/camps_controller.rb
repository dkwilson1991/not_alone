class CampsController < ApplicationController
  def show
    @camp = Camp.find(params[:id])
    @assignments = policy_scope(Assignment)
    authorize @camp
    @assignment = Assignment.new
    @previous_assignment = @camp.assignments.find_by(user: current_user)
  end

  def index
    @camps =
    if params[:query].present?
      policy_scope(Camp).search_by_address(params[:query])
    else
      policy_scope(Camp)
    end

    @markers = @camps.geocoded.map do |camp|
      {
        lat: camp.latitude,
        lng: camp.longitude,
        popup_html: render_to_string(partial: 'camps/map_popup', locals: { camp: camp })
      }
    end
  end

  def edit
    @camp = Camp.find(params[:id])
    authorize @camp
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.user = current_user
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
