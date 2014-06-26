class Blog < ActiveRecord::Base
	include ActionView::Helpers::TextHelper

	def preview
		return truncate(self.article, length: 450, seperator: ' ')
	end
end

