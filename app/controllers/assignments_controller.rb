class AssignmentsController < ApplicationController
  def index
    @assignments = policy_scope(Assignment).joins(:camp)
    @upcoming_assignments = @assignments.where('camps.start_date >= ?', Date.today).order(:start_date)
    @previous_assignments = @assignments.where('camps.start_date < ?', Date.today).order(:start_date)
    @camp = Camp.new
    @future_camps = Camp.where('start_date > ?', Date.today).order(:start_date).first(3)
    @past_camps = Camp.where('start_date <= ?', Date.today).order(:start_date)
    start_date = params.fetch(:start_date, Date.today).to_date
    @camps = Camp.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
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
    @assignment = Assignment.find(params[:id])
    authorize @assignment
    if @assignment.update(assignment_params)
      respond_to do |format|
        format.html { redirect_to camp_path(@assignment.camp) }
        format.text { render partial: "shared/vcard", locals: { user: @assignment.user, assignment: @assignment, camp: @assignment.camp }, formats: [ :html ] }
      end
    end
    # @camp = @assignment.camp
    # authorize @camp
    # if @camp.update(camp_params)
    #   redirect_to camp_path(@assignment.camp)
    # end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    authorize @assignment
    @assignment.destroy
    redirect_to assignments_path, status: :see_other
  end

  private

  def assignment_params
    params.require(:assignment).permit(:status, :role)
  end

  def camp_params
    params.require(:camp).permit(:camp_name, :address, :start_date, :end_date, :required_number_volunteers, :description, :director_email, :comments, :newsfeed_post, tag_list: [], photos:[])
  end
end
