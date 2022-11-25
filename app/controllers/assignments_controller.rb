class AssignmentsController < ApplicationController
  def index
    @assignments = policy_scope(Assignment)
    @upcoming_assignments = policy_scope(Assignment).where('start_date > ?', Date.today).order(:created_at)
    @previous_assignments = policy_scope(Assignment).where('start_date <= ?', Date.today).order(:start_date).first(3)
    @camp = Camp.new
    # start_date = params.fetch(:start_date, Date.today).to_date
    # @assignments = Assignment.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
  end

  def show
    @assignment = Assignment.find(params[:id])
    @camp = Camp.new
    authorize @camp
  end

  def create
    @camp = Camp.find(params[:camp_id])
    @assignment = Assignment.new(assignment_params)
    @assignment.user = current_user
    @assignment.camp = @camp
    authorize @assignment
    @assignment.save
    flash[:notice] = "Application submitted"
    redirect_to camp_path(@camp)
  end

  def update
    authorize @assignment
  end

  def assignment_params
    params.require(:assignment).permit(:status, :roles)
  end
end
