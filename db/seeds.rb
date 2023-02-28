# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "nokogiri"

i = 1

while i < 2

  url = "https://www.vintagefootballarea.com/collections/tous-les-maillots?page=#{i}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  # p html_doc.search(".rimage__image").first.attributes["data-src"].value

  html_doc.search(".product-block").each do |element|
    p "Description #{element.search(".title").text.strip}"
    p "Année #{element.search(".title").text.strip.split('-').first.strip}"
    p "Equipe #{element.search(".title").text.strip.split('-')[1].split('(').first.strip}"
    p "Lien Image #{element.search(".rimage__image").first.attributes["data-src"].value}"
    p "Price #{element.search(".price").text.strip.gsub('€', '')}"

    split_element = element.search(".title").text.strip.split('-')
    p split_element
    if split_element[2]
      p "Taille #{element.search(".title").text.strip.split('-')[2].split('(')[1].gsub(')', '').strip}"
      p element.search(".title").text.strip.split('-')[2].split('(')[0].split('#')
      p "Joueur #{element.search(".title").text.strip.split('-')[2].split('(')[0].split('#')[0].strip}"
      p "Numéro #{element.search(".title").text.strip.split('-')[2].split('(')[0].split('#')[1].strip}"
    else
      p "Taille #{element.search(".title").text.strip.split('-')[1].split('(')[1].gsub(')', '').strip}"
    end
    p "---------------"
  end
  i += 1
end
