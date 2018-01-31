class AddPuzzleIdToMoves < ActiveRecord::Migration[5.1]
  def change
    add_reference :moves, :puzzle, index: true, foreign_key: true
  end
end
