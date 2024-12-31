# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed the RottenPotatoes DB with some movies.
more_movies = [
  {:title => 'My Neighbor Totoro', :rating => 'G',
    :release_date => '16-Apr-1988'},
  {:title => 'Green Book', :rating => 'PG-13',
    :release_date => '16-Nov-2018'},
  {:title => 'Parasite', :rating => 'R',
    :release_date => '30-May-2019'},
  {:title => 'Nomadland', :rating => 'R',
    :release_date => '19-Feb-2021'},
  {:title => 'CODA', :rating => 'PG-13',
    :release_date => '13-Aug-2021'},
    {:title => 'Dune 2', :rating => 'PG-13',
    :release_date => '31-Dec-2023'},
    {:title => 'Cars 3', :rating => 'PG',
    :release_date => '31-Mar-2020'},
]
duplicate_movies = Movie.group(:title).having('count(*) > 1').pluck(:title)
duplicate_movies.each do |title|
    duplicate_entries = Movie.where(title: title).order(:created_at).all[1..-1]
    duplicate_entries.each(&:destroy)
  end
movies.each do |movie_hash|
unless Movie.exists?(title: movie_hash[:title]) 
    Movie.create!(movie_hash) 
end
end