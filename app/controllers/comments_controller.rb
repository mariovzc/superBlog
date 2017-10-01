class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comentario Eliminado"
      redirect_to post_path(@comment.post)
    end
  end

  def destroy
    @comment = Coment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comentario Borrado"
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)    
  end

  def set_post
    @post = Post.find(params[:id])    
  end
end
