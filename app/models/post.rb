class Post < ActiveRecord::Base
  belongs_to :user
  
  scope :published, -> { where(published: true) }
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  
  attr_accessible :title, :summary, :body
  
  extend FriendlyId
  
  friendly_id :title, use: :slugged
  
  before_create do |article|
    article.summary = article.helpers.truncate(article.body, length: 143) unless article.summary.present?
  end
  
  def helpers
    ActionController::Base.helpers
  end
  
  def publish
    self.published = true
    self.published_at = Time.now
    save
  end
  
  def unpublish
    self.published = false
    self.published_at = nil
    save
  end
end