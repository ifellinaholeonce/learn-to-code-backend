class CreatePuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzles do |t|
      t.json :grid

      t.timestamps
    end
  end
end
