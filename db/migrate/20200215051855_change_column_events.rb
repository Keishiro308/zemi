class ChangeColumnEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :title, :string, :null => false
    change_column :events, :date, :date, :null => false
    #Ex:- :null => false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
