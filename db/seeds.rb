# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Board.create({title: '新しいタスク', content: '毎日練習する。'})
# Board.create({title: '難しいタスク', content: '毎日続けて実行する。'})

john = User.create!(email: 'john3@expamle.com', password: 'password')
emily = User.create!(email: 'emily3@expamle.com', password: 'password')

5.times do
    john.boards.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 20)
    )
end

5.times do
    emily.boards.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 20)
    )
end
