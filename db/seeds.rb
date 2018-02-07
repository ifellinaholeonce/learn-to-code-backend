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
  last_name: 'Schmitke',
  email: 'tymm',
  password: 'tymm'
})

# PUZZLES

puts "Re-creating Puzzles ..."
Puzzle.destroy_all

puzzle1 = Puzzle.create!({
  game: {
    grid: [
      {x: 0, y: 0, type: "trees"}, {x: 1, y: 0, type: "trees"}, {x: 2, y: 0, type: "camp"}, {x: 3, y: 0, type: "trees"}, {x: 4, y: 0, type: "trees"},
      {x: 0, y: 1, type: "trees"}, {x: 1, y: 1, type: "trees"}, {x: 2, y: 1, type: "path"}, {x: 3, y: 1, type: "trees"}, {x: 4, y: 1, type: "trees"},
      {x: 0, y: 2, type: "path" }, {x: 1, y: 2, type: "path" }, {x: 2, y: 2, type: "path"}, {x: 3, y: 2, type: "trees"}, {x: 4, y: 2, type: "trees"},
      {x: 0, y: 3, type: "trees"}, {x: 1, y: 3, type: "trees"}, {x: 2, y: 3, type: "path"}, {x: 3, y: 3, type: "trees"}, {x: 4, y: 3, type: "trees"},
      {x: 0, y: 4, type: "trees"}, {x: 1, y: 4, type: "trees"}, {x: 2, y: 4, type: "path"}, {x: 3, y: 4, type: "trees"}, {x: 4, y: 4, type: "trees"},
    ],
    startLoc: {x: 1, y: 3 },
    startDir: 2,
    hints: ["forward", "left", "forward"]
  },
  name: "Adventure",
  concept: "Go forward"
})

puzzle2 = Puzzle.create!({
  game: {
    grid: [
      {x: 0, y: 0, type: "trees"}, {x: 1, y: 0, type: "trees"}, {x: 2, y: 0, type: "trees"}, {x: 3, y: 0, type: "trees"}, {x: 4, y: 0, type: "trees"},
      {x: 0, y: 1, type: "path"}, {x: 1, y: 1, type: "path"}, {x: 2, y: 1, type: "path"}, {x: 3, y: 1, type: "path"}, {x: 4, y: 1, type: "trees"},
      {x: 0, y: 2, type: "path" }, {x: 1, y: 2, type: "path" }, {x: 2, y: 2, type: "path"}, {x: 3, y: 2, type: "path"}, {x: 4, y: 2, type: "trees"},
      {x: 0, y: 3, type: "trees"}, {x: 1, y: 3, type: "trees"}, {x: 2, y: 3, type: "trees"}, {x: 3, y: 3, type: "path"}, {x: 4, y: 3, type: "trees"},
      {x: 0, y: 4, type: "trees"}, {x: 1, y: 4, type: "trees"}, {x: 2, y: 4, type: "camp"}, {x: 3, y: 4, type: "path"}, {x: 4, y: 4, type: "trees"},
    ],
    startLoc: {x: 2, y: 1 },
    startDir: 2,
    hints: ["forward", "forward", "right", "forward"]
  },
  name: "Lost",
  concept: "Rotate"
})

puzzle3 = Puzzle.create!({
  game: {
    grid: [
      {x: 0, y: 0, type: "path"}, {x: 1, y: 0, type: "path"}, {x: 2, y: 0, type: "camp"}, {x: 3, y: 0, type: "path"}, {x: 4, y: 0, type: "trees"},
      {x: 0, y: 1, type: "path"}, {x: 1, y: 1, type: "path"}, {x: 2, y: 1, type: "path"}, {x: 3, y: 1, type: "path"}, {x: 4, y: 1, type: "trees"},
      {x: 0, y: 2, type: "path" }, {x: 1, y: 2, type: "path" }, {x: 2, y: 2, type: "path"}, {x: 3, y: 2, type: "trees"}, {x: 4, y: 2, type: "trees"},
      {x: 0, y: 3, type: "trees"}, {x: 1, y: 3, type: "trees"}, {x: 2, y: 3, type: "path"}, {x: 3, y: 3, type: "trees"}, {x: 4, y: 3, type: "trees"},
      {x: 0, y: 4, type: "trees"}, {x: 1, y: 4, type: "trees"}, {x: 2, y: 4, type: "path"}, {x: 3, y: 4, type: "trees"}, {x: 4, y: 4, type: "trees"},
    ],
    startLoc: {x: 0, y: 1 },
    startDir: 3,
    hints: ["left", "left", "forward", "forward"]
  },
  name: "Help",
  concept: "Looping"
})

# MOVES

puts "Re-creating Moves ..."
Move.destroy_all

move1 = student1.moves.create!({
  puzzle_id: 1,
  moves: [{movement: {dir: "forward"}}, {movement: {dir: "right"}},{movement: {dir: "forward"}}],
  completed: false
})

move2 = student1.moves.create!({
  puzzle_id: 1,
  moves: [{movement: {dir: "forward"}}, {movement: {dir: "forward"}}],
  completed: true
})

move3 = student1.moves.create!({
  puzzle_id: 2,
  moves: [{movement: {dir: "forward"}}, {movement: {dir: "left"}}, {movement: {dir: "forward"}}],
  completed: false
})

move4 = student2.moves.create!({
  puzzle_id: 1,
  moves: [{movement: {dir: "left"}}, {movement: {dir: "forward"}}],
  completed: false
})

move5 = student2.moves.create!({
  puzzle_id: 1,
  moves: [{movement: {dir: "forward"}}, {movement: {dir: "forward"}}],
  completed: true
})

move6 = student2.moves.create!({
  puzzle_id: 2,
  moves: [{movement: {dir: "forward"}}, {movement: {dir: "forward"}}, {movement: {dir: "left"}}, {movement: {dir: "forward"}}, {movement: {dir: "forward"}}],
  completed: true
})

move7 = student2.moves.create!({
  puzzle_id: 2,
  moves: [
    {loop: {num: 2, cmds:[{movement: {dir: "forward"}},
    {movement: {dir: "left"}}]}},
    {movement: {dir: "forward"}},
    {movement: {dir: "left"}},
    {movement: {dir: "forward"}}],
  completed: true
})

move8 = student3.moves.create!({
  puzzle_id: 1,
  moves: [
    {movement: {dir: "forward"}},
    {movement: {dir: "right"}},
    {pickup: {item: "berry"}}],
  completed: false
})

puts "DONE!"
