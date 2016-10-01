require 'faker' 

	10.times do 
		User.create!(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: Faker::Internet.password(6), 
		confirmed_at: Time.now		
		)
	end

	users = User.all 

	10.times do
		RegisteredApplication.create!(
			name: Faker::Name.title,
			url: Faker::Internet.url,
			user: users.sample
			)
	end

	registered_applications = RegisteredApplication.all 

	100.times do
		Event.create!(
			name: Faker::Pokemon.name 
			registered_application: registered_applications.sample
			)
	end

	puts "#{User.count} users created"
	puts "#{RegisteredApplication.count} Application created"
	puts "#{Event.count} event created"