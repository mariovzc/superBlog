class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_post, only: [:edit, :show,:update,:destroy]
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)    
  end

  def new
    @post = current_user.posts.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(client_params)
      redirect_to post(@post)
    else
      render :edit
    end
  end
  def destroy
    if current_user == @post.user
      if @post.destroy
        redirect_to root_path
      end  
    end
  end
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)    
  end
end
