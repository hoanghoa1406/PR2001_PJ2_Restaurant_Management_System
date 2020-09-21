class PagesController < ApplicationController
  def home
  	@categories = Category.all
  	@dishes = Dish.all
  end
  def dish
  	  @comments = @dish.comments
  end
  def review

  end
end