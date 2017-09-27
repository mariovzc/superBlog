class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  
  def index
    @post = Post.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
