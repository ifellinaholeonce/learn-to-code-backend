class Student < User

  validates :email, :first_name, :last_name, :password, presence: true

  has_many :moves
  belongs_to :teacher

end
