class AddRegProgressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reg_progress, :string
  end
end
