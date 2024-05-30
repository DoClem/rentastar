class AddImageUrlToCelebrities < ActiveRecord::Migration[7.1]
  def change
    add_column :celebrities, :image_url, :string
  end
end
