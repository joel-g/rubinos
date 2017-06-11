require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'csv'
require 'pony'

class PizzaOrder
	attr_reader :friend, :number, :order_time, :order_description, :real_order
	def initialize(friend, number, order, order_description = [])
		@friend = friend
		@number = number
		@order_time = order_time
		@order_description = []
	end

	# def real
	# 	@real_order = true
	# end

	def add_food(order_item)
		@order_description << order_item
	end	
end




current_order = Nokogiri::HTML(open('https://www.dominos.com/en/pages/tracker/#/track/order/712970268473/StoreID/7129/')) #https://www.dominos.com/en/pages/tracker/?uph=' + number))
		if current_order.css('.orderItem')
		current_order.css('.orderItem').each do |item|
			p item.inner_html
		end
			puts "FOUND AN ORDER FOR: PREET"
			pizza = PizzaOrder.new('preet', 12345, current_order)
			current_order.css('.orderItem').each do |item|
				current_order.add_food(item)
			end
		end	


		p pizza