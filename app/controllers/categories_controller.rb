class CategoriesController < ApplicationController
  def index
	@categories = Category.all
  end

  def edit
  end

  def new
	@category = Category.new
  end
  
  def create
	@category = Category.create(cat_create);
	redirect_to categories_path
  end
  
  def cat_create
		params.require(:category).permit(:name)
  end

  def show
	@category = Category.find(params[:id])
	@title = @category.name
	@posts = @category.posts
  end
  
  def destroy
	@category = Category.find(params[:id])
	@category.destroy
	redirect_to categories_path
  end
end
