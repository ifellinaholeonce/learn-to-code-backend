class Move < ApplicationRecord
  belongs_to :student
  belongs_to :puzzle
end
