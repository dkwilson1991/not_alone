class AssignmentsController < ApplicationController
  def index
    @assignments = policy_scope(Assignment)
    @camp = Camp.new
    @future_camps = Camp.where('start_date > ?', Date.today).order(:start_date).first(3)
    @past_camps = Camp.where('start_date <= ?', Date.today).order(:start_date)

    # start_date = params.fetch(:start_date, Date.today).to_date
    # @assignments = Assignment.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
  end

  def show
    @assignment = Assignment.find(params[:id])
    @camp = Camp.new
    authorize @camp
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.user = current_user
    authorize @assignment
  end

  def update
    authorize @assignment
  end
end
