class Student < ApplicationRecord
  has_many :moves
  belongs_to :teacher
end
