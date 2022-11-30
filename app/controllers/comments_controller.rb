class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @camp = Camp.find(params[:camp_id])
    @comment.camp = @camp
    @camp.user = current_user
    @comment.user = current_user
    authorize @camp
      if @comment.save
        redirect_to camp_path(@camp)
      else
        render camp_path(@camp), status: :unprocessable_entity
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:contant)
  end
end
