class DishesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @dishes = @category.dishes
  end

  def show
    @dish = Dish.find params[:id]
    @comments = @dish.comments

    @comment = current_user.comments.build(dish_id: params[:id]) if signed_in?
  end
end
