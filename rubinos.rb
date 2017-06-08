require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'csv'
require 'pony'

class PizzaOrder
	attr_reader :friend, :number, :order_time, :order_description
	def initialize(friend, number, order, order_description = nil)
		@friend = friend
		@number = number
		@order_time = order_time
		@order_description = order_description
	end
end

def call_dominos(list, delay)
	pizza_orders = []
	list.each do |friend, number|
		this_order = Nokogiri::HTML(open('https://order.dominos.com/orderstorage/GetTrackerData?Phone=' + number))
		pizza_orders <<	PizzaOrder.new(friend, number, this_order)
		puts "Checking #{friend}..."
		sleep(delay)
	end
end

contacts = {}
# pizza_orders = [] 
test_numbers = {'Russell Wilson' => '2063331212', 'Anakin Skywalker' => '2536066666'}

CSV.foreach("contacts.csv") do |row|
	contacts[row[0]] = row[1]
end

if ARGV.any?
	mode = ARGV[0]
	each_delay = (ARGV[1] || 60).to_i
	loop_delay = (ARGV[2] || 45).to_i * 60
	if mode == 'test'
		call_dominos(test_numbers, 3)
	elsif mode == 'once'
		call_dominos(contacts, each_delay)
	elsif mode == 'loop'
		until
			call_dominos(contacts, each_delay)
			puts "Waiting #{loop_delay / 60} to check again."
			sleep(loop_delay)
		end
	else
		raise "Unknown Rubino's Command: #{ARGV[1]}"
	end			
end


# puts orders[0].order.text