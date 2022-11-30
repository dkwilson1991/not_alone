class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @camp = Camp.find(params[:camp_id])
    @comment.camp = @camp
      if @comment.save
        redirect_to camp_path(@camp)
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:contant)
  end
end
