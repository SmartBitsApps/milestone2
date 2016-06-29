class AddFamilyStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :family_status, :string
  end
end
