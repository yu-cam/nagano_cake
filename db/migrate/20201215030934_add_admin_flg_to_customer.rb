class AddAdminFlgToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :admin_flg, :boolean
  end
end
