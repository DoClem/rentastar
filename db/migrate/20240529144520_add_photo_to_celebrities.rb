class AddPhotoToCelebrities < ActiveRecord::Migration[7.1]
  def change
    add_column :celebrities, :photo, :string
  end
end
