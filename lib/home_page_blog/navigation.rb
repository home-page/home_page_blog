module HomePageBlog
  module Navigation
    def self.menu_code(resource)
      case resource
      when 'posts'
        Proc.new do |primary, options|
          primary.item :posts, I18n.t('posts.index.title'), posts_path do |posts|
            posts.item :new, I18n.t('general.new'), new_post_path
            
            unless (@post.new_record? rescue true)
              posts.item :show, @post.title, post_path(@post) do |post|
                if user_signed_in?
                  post.item :destroy, I18n.t('general.destroy'), post_path(@post), method: :delete, confirm: I18n.t('general.questions.are_you_sure')
                end
      
                post.item :show, I18n.t('general.details'), "#{post_path(@post)}#top"
                post.item :edit, I18n.t('general.edit'), edit_post_path(@post) if user_signed_in?
              end
            end
          end
        end
      end
    end
  end
end
    