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



#https://order.dominos.com/orderstorage/GetTrackerData?Phone=
def call_dominos(list, delay)
	pizza_orders = []
	list.each do |friend, number|
		puts "Checking #{friend}..."
		current_order = Nokogiri::HTML(open('https://www.dominos.com/en/pages/tracker/?uph=' + number)) #https://www.dominos.com/en/pages/tracker/?uph=' + number))
		if current_order.css('.orderItem')
		p current_order.css('.orderItem')
			puts "FOUND AN ORDER FOR: #{friend}"
			pizza = PizzaOrder.new(friend, number, current_order)
			current_order.css('.orderItem').each do |item|
				current_order.add_food(item)
			end
		end	
		sleep(delay)

	end
	pizza_orders
end

#forwarded to https://www.dominos.com/en/pages/tracker/#/track/order/712970268473/StoreID/7129/
#orderItem

# Must make break when acquires valid order

test_numbers = {'Russell Wilson' => '2063331212', 'Anakin Skywalker' => '2536066666'}
friends = {}

CSV.foreach("friends.csv") do |row|
	friends[row[0]] = row[1]
end

if ARGV.any?
	mode = ARGV[0]
	each_delay = (ARGV[1] || 60).to_i
	loop_delay = (ARGV[2] || 45).to_i * 60
	if mode == 'test'
		call_dominos(test_numbers, 3)
	elsif mode == 'once'
		call_dominos(friends, each_delay)
	elsif mode == 'loop'
		until
			call_dominos(friends, each_delay)
			puts "Waiting #{loop_delay / 60} to check again."
			sleep(loop_delay)
		end
	else
		raise "Unknown Rubino's Command: #{ARGV[1]}"
	end			
end


# XML tags to grab 'OrderDescription', 'StartTime'