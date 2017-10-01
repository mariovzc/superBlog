class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :user_post, only: [:edit,:update,:destroy]
  before_action :set_post, only: [:show]
  
  def index
    @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)    
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "Post Creado"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @post.comments
  end

  def user_posts
    @posts= current_user.posts.order('created_at DESC').paginate(:page => params[:page], :per_page => 5) 
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:success] = "Post Editado"
    else
      render :edit
    end
  end
  def destroy
    if current_user == @post.user
      if @post.destroy
        flash[:success] = "Post Eliminado"        
        redirect_to root_path
      end  
    end
  end
  private

  def set_post
    @post = Post.find(params[:id])
  end
  def user_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)    
  end
end
