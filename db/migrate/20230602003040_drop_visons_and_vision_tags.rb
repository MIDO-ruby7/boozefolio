class DropVisonsAndVisionTags < ActiveRecord::Migration[7.0]
  def change
    drop_table :visions
    drop_table :vision_tags
  end
end
