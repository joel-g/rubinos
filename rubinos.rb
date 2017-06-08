require 'nokogiri'
require 'open-uri'
require 'twilio-ruby'
require 'open_uri_redirections'
require 'csv'

class Pizza
	attr_reader :friend, :number, :order
	def initialize(friend, number, order)
		@friend = friend
		@number = number
		@order = order
	end
end

contacts = CSV.read("friends.csv")
phone_numbers = {
	joel_guerra: 2539613325,
	stormy_guerra: 2539615845
	}

p contacts[0]


# forever = true

# while forever

orders = []

	phone_numbers.each do |friend, number|
		orders <<	Pizza.new(friend, number, Nokogiri::HTML(open('https://order.dominos.com/orderstorage/GetTrackerData?Phone=' + number.to_s)))
			puts "Checking #{friend}..."
				sleep(3)
	end

puts orders[0].order.text


# end

