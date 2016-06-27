class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :logo
      t.string :company_name, null: false, default: ""
      t.string :email,        null: false, default: ""
      t.string :phone_number
      t.string :vat_id
      t.string :contact_person
      t.boolean :visible

      t.timestamps null: false
    end
    add_index :clients, :company_name, unique: true
    add_index :clients, :email, unique: true
  end
end
