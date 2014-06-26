class Coach < ActiveRecord::Base
  def image_id
    "#{user_id}.jpg"
  end

end
