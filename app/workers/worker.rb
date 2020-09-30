class Worker
  include Sidekiq::Worker

  def perform
    orders = Order.all.where("timeorder <= ? and timeorder >= ?", now + 2.hour, now )
    orders.each do |book|
      book.status = 2
      book.save
    end
  end
end

