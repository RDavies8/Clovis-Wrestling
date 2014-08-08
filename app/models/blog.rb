class Blog < ActiveRecord::Base
	include ActionView::Helpers::TextHelper
  validates :author, presence: true
  validates :title, presence: true, uniqueness: true
  validates :article, presence: true


  has_many :comments, dependent: :destroy
  belongs_to :coach

	def preview
		return truncate(self.article, length: 250, seperator: ' ')
  end

  def self.filter search
    results = Array.new
    return results if search.empty?

    blogs = Blog.all
    search = search.downcase

    blogs.each do |blog|
      if blog.title.downcase.include? search or blog.author.downcase.include? search
        results.push blog
      end
    end

    return results

  end
end

