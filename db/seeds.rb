require 'faker'

#Ces lignes pour ne pas se retrouver avec 1000 données, permet de supprimer les données précédentes à chaques qu'on $rails db:seed
User.destroy_all
Event.destroy_all
Attendance.destroy_all


i=0
5.times do |i|
	User.create!(email: "maowaw_#{i+1}@yopmail.com", description: Faker::TvShows::RuPaul.queen, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "123456")
end


5.times do 
  Event.create!(start_date: Faker::Date.forward(days: 23), description: Faker::GreekPhilosophers.quote, duration: rand(1..10)*5, title: Faker::Book.title, location: "Paris", admin: User.all.sample, price: rand(5..75))
end

12.times do
	Attendance.create!(stripe_customer_id: Faker::Alphanumeric.alpha(number: 6), event: Event.all.sample, user: User.all.sample)
end


