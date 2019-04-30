class StockExchange < ApplicationRecord

	extend StockHelper

	belongs_to :user
	belongs_to :company
	#buying stock from a particular compnay and for a particular user
	def buy units,company_id,user_id
		set_values units,company_id,user_id
		#stock_type 0 is buy, 1 is sell
		#buy stock from if any one selling
		bought_stock = ApplicationController.helpers.buy_stock @company.id,@units
		puts "-=-=-=-=-=- currently bought stock units #{bought_stock}"
		remaining_quantity = units - bought_stock
		puts "-=-=-=-=-=- remaining quantity units to buy #{remaining_quantity}"
		remaining_quantity = remaining_quantity <= 0 ? 0 : remaining_quantity
		self.update_attributes(user_id: @user.id,company_id: @company.id,quantity: units,stock_type: 0,remaining_quantity: remaining_quantity ,status: remaining_quantity == 0 ? 1 : 0)

		(0...self.remaining_quantity).each do |live_stock|
			LiveStock.create(user_id: @user.id,company_id: @company.id,quantity: 1,stock_type: 0,remaining_quantity: 1,status: 0,stock_exchange_id: self.id)
		end		
	end

	#sealling stock of a company 
	def sell units,company_id,user_id
		set_values units,company_id,user_id
		#check if any one ready to buy
		sold_stock_count = ApplicationController.helpers.sell_stock @company.id,@units
		puts "-=-=-=-=-=- currently sold stock units #{sold_stock_count}"
		remaining_quantity = units - sold_stock_count
		puts "-=-=-=-=-=- remaining quantity units to be sold #{remaining_quantity}"
		remaining_quantity = remaining_quantity <= 0 ? 0 : remaining_quantity
		self.update_attributes(user_id: @user.id,company_id: @company.id,quantity: units,stock_type: 1,remaining_quantity: remaining_quantity  ,status: remaining_quantity == 0 ? 1 : 0)
		# puts '-=-=-=-=-==-=--=-===-=-=2 sell'
		(0...self.remaining_quantity).each do |live_stock|
			LiveStock.create(user_id: @user.id,company_id: @company.id,quantity: 1,stock_type: 1,remaining_quantity: 1,status: 0,stock_exchange_id: self.id)
		end
	end
	#set the status of a user 
	# def user_status user_id
	# 	@user = User.where(:id => user_id).last
	# 	puts "No user found" if @user
	# 	status_string = "user id\t Total Sold.\t Total Bought.\t To Buy.\t To Sell\n"
	# 	total_sold,total_bought,to_buy,to_sell = ApplicationController.helpers.get_user_stock user_id
	# 	status_string += "#{user_id}\t #{total_sold}\t #{total_bought}\t #{to_buy}\t #{to_sell}\n"
	# 	puts status_string
	# end


private
	def set_values units,company_id,user_id
		@units = units
		@company = Company.where(:id => company_id).last
		@user = User.where(:id => user_id).last
	end

end
