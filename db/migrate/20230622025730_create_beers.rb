class CreateBeers < ActiveRecord::Migration[7.0]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.float :alcohol_content
      t.references :brewery, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
