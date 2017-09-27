# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.create!(manufacturer: 'BMW', model: '536', style: 'Sedan', hourly_rate: 8.5, location: '2345 Wake forest, Raleigh, NC 23456', license_plate: 'MXCX21', status: 'Approved' )
Car.create!(manufacturer: 'AUDI', model: 'Q3', style: 'Hatchback', hourly_rate: 5.5, location: '2345 Wake forest, Raleigh, NC 23456', license_plate: 'NXCX21', status: 'Approved' )
Car.create!(manufacturer: 'Jaguar', model: 'elite', style: 'Sedan', hourly_rate: 9.5, location: '2345 Wake forest, Raleigh, NC 23456', license_plate: 'RGB21', status: 'Approved' )
Car.create!(manufacturer: 'Benz', model: '5 series', style: 'Sedan', hourly_rate: 10.5, location: '2345 Wake forest, Raleigh, NC 23456', license_plate: 'NIRM21', status: 'Approved' )
User.create!(first_name: 'Stacey', last_name: 'Nathen', email: 'stacey@gmail.com', password_digest: '$2a$10$DdaplQ8VlsnDp.5euO9k4.FbuwkWVOc5HcIKzk7wqIr8SJrnWij7e', address: 'Raleigh', age: 23, license_number: '4125', credit_card_number: '7532', role: 'Admin')
User.create!(first_name: 'Nathen', last_name: 'Kick', email: 'nathen@gmail.com', password_digest: '$2a$10$dmsWQD8wkkB8FH77RX9Njewj9w0kZIGGS3pExV1z0/V/oNEiim8yO', address: 'Raleigh', age: 32, license_number: '4135', credit_card_number: '7533', role: 'Super admin')