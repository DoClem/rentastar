class RemoveCategoryFromCelebrities < ActiveRecord::Migration[7.1]
  def change
    remove_column :celebrities, :category, :string
  end
end
