class CreateVisionTags < ActiveRecord::Migration[7.0]
  def change
    create_table :vision_tags do |t|
      t.integer :vision_id
      t.string :name
      t.float :confidence

      t.timestamps
    end
  end
end
