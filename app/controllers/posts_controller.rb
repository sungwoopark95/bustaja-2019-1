class PostsController < ApplicationController
	def new
		@posts = Post.all.reverse
	end

	def create
		post = Post.new
		post.title = params[:title]
		post.content = params[:content]
		post.save

		redirect_to "/posts/show"
	end

	def destroy
		post = Post.find(params[:post_id])
		post.destroy

		redirect_to "/posts/show"
	end

	def edit
		@posts = Post.all.reverse
		@post = Post.find(params[:post_id])

	end

	def update
		post = Post.find(params[:post_id])
		post.title = params[:title]
		post.content = params[:content]
		post.save

		redirect_to "/posts/show"
	end
	
	def show
		@posts = Post.all.reverse
	    @user = User.find(session[:user_id])
	    @start = @user.start_date
	    @end = @user.end_date
	    @span = @end - @start
	    @passed = Date.today - @start
	    @progress = @passed.to_i * 20 / @span.to_i
	    
	    
	    @post_progress = Hash.new
	    
	    (0...Post.all.length).each do |i|
	      @post_progress[i] = (Post.all[i].created_at.to_date - @start).to_i * 20 / @span.to_i
	    end
	    
	    @significant = Array(@post_progress.values) + Array(@progress)
	end
	
	def show_edit
		@posts = Post.all.reverse
		@post = Post.find(params[:post_id])
	    @user = User.find(session[:user_id])
	    @start = @user.start_date
	    @end = @user.end_date
	    @span = @end - @start
	    @passed = Date.today - @start
	    @progress = @passed.to_i * 20 / @span.to_i
	    
	    
	    @post_progress = Hash.new
	    
	    (0...Post.all.length).each do |i|
	      @post_progress[i] = (Post.all[i].created_at.to_date - @start).to_i * 20 / @span.to_i
	    end
	    
	    @significant = Array(@post_progress.values) + Array(@progress)
	end
end
