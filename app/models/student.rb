class Student < ApplicationRecord

  has_secure_password

  has_many :moves
  belongs_to :teacher

end
