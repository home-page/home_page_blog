module BlogController
  extend ActiveSupport::Concern
  
  def index
    @posts = Post
    
    if user_signed_in?
      @posts = @posts.order('created_at DESC')
    else 
      @posts = @posts.where(published: true)
      @posts = @posts.order('published_at DESC')
    end
    
    @posts = @posts.paginate(page: params[:page], per_page: 10)
    begin; @sidebar_modules = PageModule.by_collection_slug('blog-post-sidebar'); rescue ActiveRecord::RecordNotFound; nil; end
    @home_page_stylesheets = ['home_page/application', 'home_page_blog/posts']
    
    render 'posts/index', layout: 'home_page_blog/application'
  end
end