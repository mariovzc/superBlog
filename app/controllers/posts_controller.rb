class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)    
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
    
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    
  end
end
