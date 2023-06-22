class CreateBreweries < ActiveRecord::Migration[7.0]
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :state
      t.integer :country_of_origin
      t.text :website

      t.timestamps
    end
  end
end
