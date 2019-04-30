# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
	User.create([{name: 'Dileep', phone: 8951627202,email: 'dileep.pdkr@gmail.com' ,password: SecureRandom.base64(15)}, {name: 'Ramesh', phone: 123456782 ,email: 'ramesh@gmail.com' ,password: SecureRandom.base64(15)},{name: 'Ramu', phone: 9879879879,email: 'ramu@gmail.com' ,password: SecureRandom.base64(15)}])
  Company.create([{name: 'MARUTI', total_units: 400}, {name: 'LG', total_units: 300}, {name: 'SAMSUNG', total_units: 250}, {name: 'APPLE', total_units: 600}])
