# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

## TEACHERS

puts "Re-creating Teachers ..."
Teacher.destroy_all

teacher1 = Teacher.create!({
  email: 'teacher',
  password: 't'
})


## STUDENTS

puts "Re-creating Students ..."
Student.destroy_all

student1 = teacher1.students.create!({
  email: 'mandy',
  password: 'm'
})

student2 = teacher1.students.create!({
  email: 'andrew',
  password: 'a'
})

student3 = teacher1.students.create!({
  email: 'tymm',
  password: 't'
})


# ## MOVE

# puts "Re-creating Moves ..."
# Move.destroy_all

# move1 = student1.moves.create!({
#   moves: '["right"]',
#   attempts: 0,
#   completed: false
# })

# move2 = student2.moves.create!({
#   moves: '["left"]',
#   attempts: 0,
#   completed: false
# })

# move3 = student3.moves.create!({
#   moves: '["forward"]',
#   attempts: 0,
#   completed: false
# })


# ## PUZZLES

# puts "Re-creating Puzzles ..."
# Puzzle.destroy_all

# puzzle1 = Puzzle.create!({
#   logic: 'example puzzle'
# })


puts "DONE!"
