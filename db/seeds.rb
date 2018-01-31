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
  email: 'mandy',
  password: 'mandy'
})

student2 = teacher1.students.create!({
  first_name: 'Andrew',
  last_name: 'Carroll',
  email: 'andrew',
  password: 'andrew'
})

student3 = teacher1.students.create!({
  first_name: 'Tymm',
  last_name: 'S',
  email: 'tymm',
  password: 'tymm'
})

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

# MOVES

puts "Re-creating Moves ..."
Move.destroy_all

move1 = student1.moves.create!({
  puzzle_id: 1,
  moves: JSON.generate(["forward", "right", "forward"]),
  completed: false
})

move2 = student1.moves.create!({
  puzzle_id: 1,
  moves: JSON.generate(["forward", "forward"]),
  completed: true
})

move3 = student1.moves.create!({
  puzzle_id: 2,
  moves: JSON.generate(["forward", "left", "forward"]),
  completed: false
})

move4 = student2.moves.create!({
  puzzle_id: 1,
  moves: JSON.generate(["left", "forward"]),
  completed: false
})

move5 = student2.moves.create!({
  puzzle_id: 1,
  moves: JSON.generate(["forward", "forward"]),
  completed: true
})

move6 = student2.moves.create!({
  puzzle_id: 2,
  moves: JSON.generate(["forward", "forward", "left", "forward", "forward"]),
  completed: true
})

move7 = student2.moves.create!({
  puzzle_id: 2,
  moves: JSON.generate(["forward", "forward", "left", "forward", "left", "forward"]),
  completed: true
})

move8 = student3.moves.create!({
  puzzle_id: 1,
  moves: JSON.generate(["forward", "right", "forward"]),
  completed: false
})

puts "DONE!"
