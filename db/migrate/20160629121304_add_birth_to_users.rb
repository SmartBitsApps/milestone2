class AddBirthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth_name, :string
    add_column :users, :birth_date, :string
    add_column :users, :gender, :string
    add_column :users, :birth_number, :string
    add_index :users, :birth_number
    add_column :users, :birth_place, :string
  end
end
