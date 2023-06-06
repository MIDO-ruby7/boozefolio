class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :item, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
