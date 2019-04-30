module StockHelper
	def sell_stock company_id,quantity
		puts '-=-=-=-=-= sell stock if any one ready to buy'
		# puts "------ @company_id #{company_id} --- @units #{quantity} --- stock_type 0 - status 0"
		all_records = LiveStock.where(:stock_type => 0,:status => 0, :company_id => company_id).limit(quantity).order('id asc')
		# puts all_records.size
		if all_records
			if all_records
				all_records.group(:stock_exchange_id).sum(:remaining_quantity).each do |stock_exchange_id,units|
					# puts "-=-=-=-=-=-stock_exchange_id #{stock_exchange_id}"
					# puts "-=-=-=-=-=- units #{units}"
					units = (units - quantity) >= 0 ? (units - quantity) : 0
					# puts "-=-=-=-=-=- units #{units}"
					update_remaining_quantity stock_exchange_id,units
				end
			end

			result = all_records.update_all(:status => 1, remaining_quantity: 0) 
			
		end
		return result
	end

	def buy_stock company_id,quantity
		all_records = LiveStock.where(:stock_type => 1,:status => 0, :company_id => company_id).limit(quantity).order('id asc')
		puts "-=-=-=-=-= buy stock if any one selling already"
		# puts all_records.size
		if all_records
			if all_records
				all_records.group(:stock_exchange_id).sum(:remaining_quantity).each do |stock_exchange_id,units|
					# puts "-=-=-=-=-=-stock_exchange_id #{stock_exchange_id}"
					# puts "-=-=-=-=-=- units #{units}"
					units = (units - quantity) >= 0 ? (units - quantity) : 0
					# puts "-=-=-=-=-=- units #{units}"
					update_remaining_quantity stock_exchange_id,units
				end
			end

			result = all_records.update_all(:status => 1, remaining_quantity: 0) 
			
		end

		return result
	end


	def update_remaining_quantity id,units
		record  = StockExchange.find(id)
		remaining_quantity = units <= 0 ? 0 : units 
		# puts "-=-=-=- final remaining_quantity #{remaining_quantity}"

		result = record.update_attributes(:remaining_quantity => remaining_quantity,:status => remaining_quantity <= 0 ? 1 : 0)
	end
end
