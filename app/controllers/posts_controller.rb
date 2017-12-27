class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	
	def show
		@post = Post.find(params[:id])
	end
	
	def new 
		@post = Post.new
		@category = Category.all
	end
	
	def create
		@post = Post.create(post_params_create)
		redirect_to posts_path, :notice => "Your post has been saved"
		# if @post.save
			# redirect_to posts_path, :notice => "Your post has been saved"
		# else
			# render "New"
		# end
	end
	
	def post_params_create
		params.require(:post).permit(:title, :body, :category_id)
	end
	
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		# if @post.update_attributes(params[:post])
			# redirect_to post_path, :notice => "Your post has been updated"
		# else
			# render "edit"
		# end
		@post.update(post_params)
	end
	def post_params
	# we construct a strong parameters whitelist below
	# require(:post) means that the `params` hash MUST contain a :post key
	# permit(:title, :body, ...) = here we enumerate the attributes which we will accept from the form parameters; it acts as a whitelist
	params.require(:post).permit(:title, :body) 
	end	
	def destroy
	
	end	

end
