class CreateOrderAndOrderDetails
  attr_reader :params, :user

  def initialize(params, user)
    @params = params
    @user = user
  end

  def perform
    ActiveRecord::Base.transaction do 
      table_id = params[:order][:table].first[:id]
      order = Order.create!(name: params[:order][:name], table_id: table_id, user: user , timeorder: params[:order][:timeorder])
      
      total_price = 0
      
      params[:dishes].values.each do |dish|
        d = Dish.find_by(id: dish[:dish_id])
        next unless d 
        quantity = dish[:quantity].to_i
        next if quantity == 0
        price =  d.money
        total_price += price * quantity
        order.order_details.create!(dish_id: d.id, quantity: quantity, price: d.money, cost: price * quantity)
      end
      order.update! total_price: total_price
    end
    true
  rescue StandardError => e 
    Rails.logger.error e.message
    false
  end
    
end

