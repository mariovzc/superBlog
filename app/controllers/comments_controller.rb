class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    end
  end
  def destroy
    @comment = Coment.find(params[:id])
    if @comment.destroy
      redirect_to :back
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)    
  end
end