class User < ApplicationRecord


	has_many :stock_exchanges
	has_many :live_stocks
end
