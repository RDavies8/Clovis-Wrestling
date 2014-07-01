class Coach < ActiveRecord::Base
  has_many :blogs
  belongs_to :user
  def image_id
    "#{ref}.jpg"
  end

end
