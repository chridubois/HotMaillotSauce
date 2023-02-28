# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "nokogiri"

# User seeds
christophe = User.create(
  email: "idategto11@gmail.com",
  password: "password"
)
ilyes = User.create(
  email: "ilyes.messaoudene13013@gmail.com",
  password: "password"
)
candice = User.create(
  email: "candince.fays@ymail.com",
  password: "password"
)
charlotte = User.create(
  email: "charlottebene@gmail.com",
  password: "password"
)

p User.all


# Jersey seeds

i = 1

while i < 50

  url = "https://www.vintagefootballarea.com/collections/tous-les-maillots?page=#{i}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  # p html_doc.search(".rimage__image").first.attributes["data-src"].value

  html_doc.search(".product-block").each do |element|
    exclude = false
    # description = element.search(".title").text.strip
    year = element.search(".title").text.strip.split('-').first.strip
    team = element.search(".title").text.strip.split('-')[1].split('(').first.strip
    photo = "https:#{element.search(".rimage__image").first.attributes["data-src"].value.gsub('{width}', '1080')}"
    price_per_day = element.search(".price").text.strip.gsub('€', '')

    split_element = element.search(".title").text.strip.split('-')
    if split_element[2]
      size = element.search(".title").text.strip.split('-')[2].split('(')[1].gsub(')', '').strip
      if element.search(".title").text.strip.split('-')[2].split('(')[0].split('#')[1].nil?
        exclude = true
      else
        player = element.search(".title").text.strip.split('-')[2].split('(')[0].split('#')[0].strip
        numero = element.search(".title").text.strip.split('-')[2].split('(')[0].split('#')[1].strip
      end
    else
      size = element.search(".title").text.strip.split('-')[1].split('(')[1].gsub(')', '').strip
    end

    if exclude == false

      jersey = Jersey.create(
        year: year,
        team: team,
        photo: photo,
        price_per_day: price_per_day,
        size: size,
        player: player,
        number: numero,
        user: User.find(rand(1..4)),
        state: "new",
        seller_address: "3 rue Chevreul 75011 Paris"
      )
      p jersey
      p "---------------"
    end
  end
  i += 1
end
