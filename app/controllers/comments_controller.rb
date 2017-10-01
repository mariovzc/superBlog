class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comentario Eliminado"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comentario Borrado"
      redirect_to post_path(@post)      
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)    
  end

  def set_post
    @post = Post.find(params[:post_id])    
  end
end
