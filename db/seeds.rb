
PASSWORD = "supersecret"
Review.delete_all
Idea.delete_all
User.delete_all



super_user = User.create(
    first_name: "jose",
    last_name: "val",
    email: "jmvr@hotmail.com",
    password: PASSWORD,
)


10.times do 
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: PASSWORD,
    )
end

200.times do 
    created_at = Faker::Date.backward(365 * 5)


    i = Idea.create(
    title: Faker::Hacker.say_something_smart,
    description: Faker::ChuckNorris.fact,
    created_at: created_at,
    )
    if i.valid?
        i.reviews = rand(0..15).times.map do 
            Review.new(body: Faker::Movie.quote)
        end
    end
end



puts Cowsay.say("generated #{Idea.count} ideas", :koala)
puts Cowsay.say("generated #{Review.count} reviews", :stegosaurus)
puts Cowsay.say("generated #{User.count} users", :stegosaurus)
