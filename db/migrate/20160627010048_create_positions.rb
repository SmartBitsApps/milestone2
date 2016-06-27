class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title,      null: false, default: ""
      t.text :description,  null: false, default: ""
      t.text :requirements, null: false, default: ""

      t.timestamps null: false
    end
  end
end
