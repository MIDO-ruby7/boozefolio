class DropTableVisonsAndVisonTags < ActiveRecord::Migration[7.0]
  def change
    drop_table :vision_tags
    drop_table :visions
  end
end
