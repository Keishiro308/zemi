class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :post, null: false
      #Ex:- :null => false
      t.string :name, null: false
      #Ex:- :null => false

      t.timestamps
    end
  end
end
