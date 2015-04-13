class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @idea = Idea.find(params[:idea_id])
    @comment.idea = @idea

    if @comment.save
      redirect_to @idea, notice: "Comment Added!"
    else
      render "/ideas/show"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
