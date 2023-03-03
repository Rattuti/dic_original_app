# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user_id:id=1でログインしている過程で、seedデータをdbへ登録している
3.times do |number|
    Message.create!(content: "#{number}番目のメッセージです！", user_id: User.first.id)
    puts "#{number + 1}番目のメッセージを作成しました"
end
puts "メッセージの作成が完了しました"

3.times do |number|
    Article.create!(title: "#{number + 1}番目のtitle", url: "#{number + 1}番目のurl", user_id: User.first.id)
    puts "#{number + 1}番目のurlを作成しました"
end
puts "urlの作成が完了しました"

4.times do |number|
    Event.create!(name: "予定 #{number + 1}", start: "2023-02-14 10:00:00", end: "2023-02-14 11:00:00", user_id: User.first.id)
    puts "予定 #{number + 1}の作成が完了しました"
end
puts "Eventの作成が完了しました"