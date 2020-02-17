class ChangeColumnInImage < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :post_id
    add_reference :images, :event, index: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
