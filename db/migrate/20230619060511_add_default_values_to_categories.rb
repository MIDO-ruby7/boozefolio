class AddDefaultValuesToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :default_alcohol_content, :float
    add_column :categories, :default_size, :integer
  end
end
