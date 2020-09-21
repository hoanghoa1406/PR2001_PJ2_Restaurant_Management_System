class DishesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @dishes = @category.dishes
  end

  def show
    @dish = Dish.find params[:id]
     @comments = @dish.comments
    
    if signed_in?
      @comment = current_user.comments.build(dish_id: params[:id])
    end
  end 
end