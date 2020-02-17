class RemoveImagesFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :images
  end
end
