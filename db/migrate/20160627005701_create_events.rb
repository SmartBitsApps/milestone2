class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user,   index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.string :title,      null: false, default: ""
      t.text :description,  null: false, default: ""
      t.string :image
      t.string :start_date, null: false, default: ""
      t.string :end_date,   null: false, default: ""
      t.string :address,    null: false, default: ""
      t.integer :manager
      t.boolean :visible,   default: false

      t.timestamps null: false
    end
  end
end
