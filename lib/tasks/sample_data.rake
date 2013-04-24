namespace :db do
  desc "Fill database with sample articles"
  task populate: :environment do
    make_articles
  end
end

def make_articles
  10.times do |n|
    title = Faker::Lorem.words
    body = Faker::Lorem.paragraph
    Article.create!(title: title, body: body)
  end
end
