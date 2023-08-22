class CreateDrinkingRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :drinking_records do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
