class PostsController < ApplicationController
	def index
			@random = ([*('A'..'Z'),*('0'..'9'),*('a'..'z')]).sample(3).join
			# @p = Post.all
			# render inline: "<%= debug @p %>"
	end

	def post
		@url = params[:all]
		@post = Post.find_by url: @url

		if !@post
			@post = Post.new
			@post.url = @url
			@post.save
		end

	end

	def update
		@post = Post.find_by url: params[:url]
		@post.content = params[:content]
		@post.save
		render inline: "<%= @post.inspect %>"
	end

	def refresh
		@post = Post.find_by url: params[:url]
		render text: "<%= @post.content %>"
	end

end
