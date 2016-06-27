class CreateBrigades < ActiveRecord::Migration
  def change
    create_table :brigades do |t|
      t.references :event,     index: true, foreign_key: true
      t.references :position,  index: true, foreign_key: true
      t.integer :quantity,     null: false, default: 0
      t.boolean :visible,      default: false

      t.timestamps null: false
    end
  end
end
