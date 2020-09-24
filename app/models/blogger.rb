class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  def post_likes
    self.posts.likes
  end
  
  def featured_post
    posts = self.posts.sort_by {|post| post.likes}.reverse
    posts.first.title
  end

end
