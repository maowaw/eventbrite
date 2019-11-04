require 'faker'

#Ces lignes pour ne pas se retrouver avec 1000 données, permet de supprimer les données précédentes à chaques qu'on $rails db:seed
User.destroy_all
Event.destroy_all
Attendance.destroy_all



5.times do
	User.create!(email: "John#{rand(1..5)}@yopmail.com", description: Faker::TvShows::RuPaul.queen, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, encrypted_password: "1234")
end


5.times do 
  Event.create!(start_date: Faker::Date.forward(days: 23), description: Faker::GreekPhilosophers.quote, title: "ceciestunevent", location: "Paris", admin: User.all.sample)

12.times do
	Attendance.create!(stripe_customer_id: "blublobli", event: Event.all.sample, user: User.all.sample)
end


end