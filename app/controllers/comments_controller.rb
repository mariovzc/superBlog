class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Post Created"
      redirect_to post_path(@comment.post)
    end
  end
  def destroy
    @comment = Coment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Post Deleted"
      redirect_to :back
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)    
  end
end
