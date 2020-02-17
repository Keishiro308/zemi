class AddImagesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :images, :json
  end
end
