class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy]

	def require_login
    	unless logged_in?
      		flash.notice = "You must be logged in to access this section"
      		redirect_to root_path
    	end
  	end

	def index
		@tags = Tag.order(:name)
	end

	def show
  		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash.notice = "Tag '#{@tag.name}' Deleted!"

		redirect_to tags_path
	end
end
