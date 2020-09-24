class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def featured_post
    posts = self.posts.sort_by { |post| post.likes }.reverse
        if posts.length <1
            p "No Posts Yet"
        else
    posts.first.title
        end
  end

  def average_age
    unique_blogger = self.bloggers.uniq
    total_age = unique_blogger.collect.sum do |blogger|
      blogger.age
    end
    total_age / unique_blogger.length
  end
end
