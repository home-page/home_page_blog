class PostsController < ApplicationController
  include BlogController
  
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :find_resource, only: [:show, :edit, :update, :publish, :unpublish, :destroy]
  before_filter :show_breadcrumbs, only: [:new, :show, :edit]
  
  def show
    @home_page_stylesheets = ['home_page/application', 'home_page_blog/posts']
    
    render layout: 'home_page_blog/application'
  end
  
  def new
    @post = Post.new(params[:post])
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    
    if @post.save
      redirect_to @post, notice: t('general.form.successfully_created')
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: t('general.form.successfully_updated')
    else
      render :edit
    end
  end
  
  def publish
    options = {}

    if @post.publish
      options[:notice] = t('posts.publish.successful')
    else  
      options[:alert] = t('posts.publish.unsuccessful')
    end
    
    redirect_to posts_path, options
  end
  
  def unpublish
    options = {}

    if @post.unpublish
      options[:notice] = t('posts.unpublish.successful')
    else  
      options[:alert] = t('posts.unpublish.unsuccessful')
    end
    
    redirect_to posts_path, options
  end

  def destroy
    @post.destroy
    
    redirect_to posts_path, notice: t('general.form.destroyed')
  end
  
  def resource
    @post
  end
  
  private
  
  def find_resource
    @post = Post.friendly
    @post = @post.where(published: true) unless user_signed_in?
    @post = @post.find(params[:id])
  end
end