class WrestlersController < ApplicationController
	def index
		@wrestlers = Wrestler.all
	end
end
