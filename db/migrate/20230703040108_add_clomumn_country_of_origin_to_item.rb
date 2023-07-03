class AddClomumnCountryOfOriginToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :country_of_origin, :integer ,  default: 392
  end
end
