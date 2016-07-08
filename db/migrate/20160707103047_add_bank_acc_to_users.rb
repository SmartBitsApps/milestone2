class AddBankAccToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank_acc, :string
  end
end
