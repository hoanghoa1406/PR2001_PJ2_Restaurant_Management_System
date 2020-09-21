class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :category
  protected
 
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  def article_params
      params.require(:dish).permit(:title, :image)
   end

   def category
    @categories = Category.all
    @category=Category.find_by params[:category_id]
    @dishes = Dish.all
   end

end