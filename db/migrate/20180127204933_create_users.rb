class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :email, index: true
      t.string :password_digest
      t.references :teacher

      t.timestamps
    end
    add_index :users, [:id, :type], unique: true
  end
end
