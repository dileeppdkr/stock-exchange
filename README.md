# PARKING LOT

This README would normally document whatever steps are necessary to get the
application up and running.

#Simple Stock Exchange

Description:

A stock order is an order to buy/sell a given quantity of stocks of specified company. Person willing to buy or sell a stock will submit an order to a stock exchange, where it is executed against the opposite side order of same company i.e, buy order is executed against an existing sell order and vice-versa. 
The criteria for stock orders execution is that, they should belong to same company, they are opposite sides ( Buy vs Sell), and order of arrival i.e, the order is executed against the first available order. 
The left over quantity after execution is called remaining quantity. 
 

For example, if a buy order of quantity 10 is executed against a sell order of quantity 5, the remaining quantity of buy and sell orders are 5 and 0 respectively. An order status is called OPEN if the remaining quantity is greater than zero(>0), otherwise it’s called CLOSED(i.e., remaining quantity = 0). Your task is to implement stock order execution system which takes input orders from console, process them and gives status and remaining quantity of all the orders as output. The solution should efficiently handle high volumes of orders [ brute-force
approach may not be a scalable solution].


Things you may want to cover:

## Ruby version
	ruby '2.3.1'
## System dependencies
	None
*Setup:* 

## Download repository
	git clone git@github.com:dileeppdkr/stock-exchange.git
	cd stock-exchange

## To install all dependencies, compile: 
	bin/setup
## To run the program and launch the shell (Interactive shell): 
	bin/stock

#Example: Interactive

## To install all dependencies, compile: 
	bin/setup
## To run the code so it accepts input from a console:
	bin/stock
	buy units company_id user_id
	$ buy 20 1 1
	currently bought stock units 0
	remaining quantity units to buy 20

	sell units company_id user_id
	$ sell 10 1 2
	currently sold stock units 10
	remaining quantity units to be sold 0

	


