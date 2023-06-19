class AddFlavorToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :flavor, :string
    add_column :items, :maker, :string
    add_column :items, :alcohol_content, :float
    add_column :items, :country_of_origin, :string
    add_column :items, :region, :string
    add_column :items, :link, :string
    add_column :items, :note, :text
    add_column :items, :asin, :string
  end
end
