class CommentsController < ApplicationController
	include CommentsHelper

	before_filter :require_login, except: [:create]
	def require_login
    	unless logged_in?
      		flash.notice = "You must be logged in to access this section"
      		redirect_to root_path
    	end
    end
    
	def create
  		@comment = Comment.new(comment_params)
  		@comment.article_id = params[:article_id]

  		@comment.save

  		redirect_to article_path(@comment.article)
	end
end
