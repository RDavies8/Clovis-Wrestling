class CoachesController < ApplicationController
	def index
		@coaches = Coach.all
	end

	def show
		@coach = Coach.find_by_ref(params[:id])
    temp_coaches = Coach.all
    @coaches = []
    num_coaches = Coach.count
    pos = @coach.id + 1

    for i in 0..3
      if num_coaches == pos
        pos = 1
      end
      @coaches.push temp_coaches[pos - 1]
      pos += 1
    end

    @posts = @coach.blogs
	end
end
