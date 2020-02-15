class Add < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :detail, :text
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
