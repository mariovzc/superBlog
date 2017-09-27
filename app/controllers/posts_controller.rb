class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)    
  end

  def new
    @post = Post.new()
  end

  def create
    post = Post.new(post_params)
    if post.save
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      
    else
      render :edit
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
