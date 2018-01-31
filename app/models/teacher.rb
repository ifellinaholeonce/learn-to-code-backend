class Teacher < User

  has_many :students
  validates :email, :first_name, :last_name, :password, presence: true

end
