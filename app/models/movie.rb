# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)

  #has_many(:characters, :class_name => "Character", :foreign_key => "character_id")
  has_many(:characters)
  has_many(:movies, :through => :characters, :source => :movie)

  belongs_to(:director)
end
