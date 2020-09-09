class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  # GET /admin/categories
  def index
    @categories = Category.paginate(page: params[:page],per_page: 10)
  end
  # GET /admin/categories/1
  def show
    @dishes = @category.dishes.paginate(page: params[:page],per_page: 10)
  end
  # GET /admin/categories/new
  def new
    @category = Category.new
  end
  # POST /admin/categories
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Create Category"
      redirect_to admin_categories_path
      else 
        flash[:danger] = "Register failed"
        render 'new'
  end
  end
  # GET /admin/categories/1/edit
  def edit
  end
  # PATCH/PUT /admin/categories/1
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
    # Handle a successful update.
      flash[:success] = "Category updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  # DELETE /admin/categories/1
  def destroy
    @category.destroy
    flash[:success] = "Category was successfully destroyed."
    redirect_to admin_categories_url
  end
  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end
end