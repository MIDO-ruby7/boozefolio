class ChangeClomumnCountryOfOriginToItem < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :link, :text
    remove_column :items, :note, :text
    remove_column :items, :asin, :string
    remove_column :items, :flavor, :string
    remove_column :items, :country_of_origin, :string
  end
end
