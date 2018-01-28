class CreateMoves < ActiveRecord::Migration[5.1]
  def change
    create_table :moves do |t|
      t.json :moves
      t.integer :attempts
      t.boolean :completed

      t.timestamps
    end

    add_reference :moves, :student, index: true, foreign_key: true
  end
end
