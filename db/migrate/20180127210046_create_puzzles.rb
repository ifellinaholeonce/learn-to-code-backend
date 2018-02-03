class CreatePuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzles do |t|
      t.string :name
      t.string :concept
      t.json :game

      t.timestamps
    end
  end
end
