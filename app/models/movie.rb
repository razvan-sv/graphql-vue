class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :genres
  has_many :critic_ratings, class_name: 'MovieRating'

  belongs_to :production_house
end
