require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'csv'
require 'pony'

class Pizza
	attr_reader :friend, :number, :order_time, :order_description
	def initialize(friend, number, order, order_description)
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
		pizza_orders <<	Pizza.new(friend, number, this_order.)
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
	delay = ARGV[1].to_i || 60
	if ARGV[0] == 'test'
		call_dominos(test_numbers, 3)
	elsif ARGV[0] == 'once'
		call_dominos(contacts, delay)
	elsif ARGV[0] == 'loop'
		until
			call_dominos(contacts, delay)
		end
	else
		raise "Unknown Rubino's Command: #{ARGV[1]}"
	end			
end


# puts orders[0].order.text