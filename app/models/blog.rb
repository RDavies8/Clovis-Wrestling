class Blog < ActiveRecord::Base
	include ActionView::Helpers::TextHelper
  validates :author, presence: true
  validates :title, presence: true, uniqueness: true
  validates :article, presence: true


  has_many :comments, dependent: :destroy
  belongs_to :coach

	def preview
		return truncate(self.article, length: 450, seperator: ' ')
  end
end

