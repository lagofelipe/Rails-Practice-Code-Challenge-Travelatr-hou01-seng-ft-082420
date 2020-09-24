class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, presence: true
  validates :content, length: { minimum: 100 }

  def blogger_name
    self.blogger.name
  end

  def post_destination
    city = self.destination.name
    country = self.destination.country
    city + " : " + country
  end

end
