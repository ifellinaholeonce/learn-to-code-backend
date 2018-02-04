class Student < User

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true

  has_many :moves
  belongs_to :teacher

end
