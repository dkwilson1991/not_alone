class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
    @assignments = policy_scope(Assignment)
    @camp = Camp.new
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
