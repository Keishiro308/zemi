class CreateBookmarkings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarkings do |t|
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
