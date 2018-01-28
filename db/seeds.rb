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
  first_name: 'Jane',
  last_name: 'Doe',
  email: 'teacher@example.com',
  password: 'teacher'
})


## STUDENTS

puts "Re-creating Students ..."
Student.destroy_all

student1 = teacher1.students.create!({
  first_name: 'Mandy',
  last_name: 'Cheang',
  username: 'mandy',
  password: 'mandy'
})

student2 = teacher1.students.create!({
  first_name: 'Andrew',
  last_name: 'Carroll',
  username: 'andrew',
  password: 'andrew'
})

student3 = teacher1.students.create!({
  first_name: 'Tymm',
  last_name: 'S',
  username: 'tymm',
  password: 'tymm'
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


# PUZZLES

puts "Re-creating Puzzles ..."
Puzzle.destroy_all

puzzle1 = Puzzle.create!({
  grid: JSON.generate({
    board: [
      ["trees", "trees", "trees"],
      ["path", "path", "camp"],
      ["trees", "trees", "trees"]],
    player: {x: 1, y: 3 }
  })
})

puzzle2 = Puzzle.create!({
  grid: JSON.generate({
    board: [
      ["trees", "trees", "camp"],
      ["trees", "trees", "path"],
      ["path", "path", "path"]],
    player: {x: 1, y: 2 }
  })
})

puzzle3 = Puzzle.create!({
  grid: JSON.generate({
    board: [
      ["path", "path", "path", "path", "path"],
      ["path", "trees", "path", "trees", "path"],
      ["path", "path", "path", "path", "path"],
      ["path", "trees", "path", "trees", "path"],
      ["path", "path", "path", "path", "path"]],
    player: {x: 3, y: 3 }
  })
})

puts "DONE!"
