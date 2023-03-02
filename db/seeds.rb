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
  password: "password",
  firstname: "Christophe",
  lastname: "Dubois",
  team: "Marseille",
  avatar: "https://picsum.photos/200/300",
  phone_number: "0684889073",
  seller_address: "75 rue Sainte Cécile, 13005, Marseille"
)
ilyes = User.create(
  email: "ilyes.messaoudene13013@gmail.com",
  password: "password",
  firstname: "Ilyes",
  lastname: "Messaoudene",
  team: "PSG",
  avatar: "https://picsum.photos/200/300",
  phone_number: "0684889073",
  seller_address: "75 rue Sainte Cécile, 13005, Marseille"
)
candice = User.create(
  email: "candice.fays@ymail.com",
  password: "password",
  firstname: "Candice",
  lastname: "Fays",
  team: "Saint Etienne",
  avatar: "https://picsum.photos/200/300",
  phone_number: "0684889073",
  seller_address: "75 rue Sainte Cécile, 13005, Marseille"
)
charlotte = User.create(
  email: "charlottebene@gmail.com",
  password: "password",
  firstname: "Charlotte",
  lastname: "Benedetti",
  team: "Barcelone",
  avatar: "https://picsum.photos/200/300",
  phone_number: "0684889073",
  seller_address: "75 rue Sainte Cécile, 13005, Marseille"
)

p User.all

user_count = User.all.count

# Jersey seeds

i = 1

while i < 100

  url = "https://www.vintagefootballarea.com/collections/tous-les-maillots?page=#{i}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  # p html_doc.search(".rimage__image").first.attributes["data-src"].value

  html_doc.search(".product-block").each do |element|
    exclude = false
    split_element = element.search(".title").text.strip.split(' - ')
    year = split_element.first.strip
    next if split_element[1].nil?

    team = split_element[1].split('(').first.strip
    photo = "https:#{element.search('.rimage__image').first.attributes['data-src'].value.gsub('{width}', '1080')}"
    price_per_day = element.search(".price").text.strip.gsub(',', '.').gsub('€', '')

    if split_element[2]
      size = split_element[2].split('(')[1].gsub(')', '').strip
      if split_element[2].split('(')[0].split('#')[1].nil?
        exclude = true
      else
        player = split_element[2].split('(')[0].split('#')[0].strip
        number = split_element[2].split('(')[0].split('#')[1].strip
      end
    else
      next if split_element[1].split('(')[1].nil?

      size = split_element[1].split('(')[1].gsub(')', '').strip
    end

    state = ["Neuf", "Neuf sans étiquette", "Très bon état", "Passable", "Médiocre", "Plein de sueur"].sample
    description = "Ce maillot de l’équipe de #{team} est incroyable. Il a été porté #{player ? "par #{player}" : ''} lors de la finale de
    Champions League durant la saison #{year}.
    Ce maillot est #{state}.
    Ce maillot a été signé #{player ? "par #{player}" : ''}, lui même, lors de son dernier match avec la #{team}.
    Ce maillot est disponible en taille #{size}"

    next if exclude == true

    jersey = Jersey.create(
      year:,
      team:,
      photo:,
      price_per_day:,
      size:,
      player:,
      number:,
      user: User.find(rand(1..user_count)),
      state:,
      description:
    )
    p jersey
    p "---------------"
  end
  i += 1
end

p "Creating orders"

30.times do
  begin_date = (Date.today - rand(1..30))
  end_date = begin_date + rand(1..30)
  order = Order.create(
    begin_date:,
    end_date:,
    user: User.find(rand(1..User.all.count)),
    jersey: Jersey.find(rand(1..Jersey.all.count)),
    total_amount: rand(15..23_440)
  )
end
