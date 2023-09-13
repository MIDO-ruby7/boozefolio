class RenameUserStampsTableToMessageStampRelationships < ActiveRecord::Migration[7.0]
  def change
    rename_table :user_stamps, :message_stamp_relationships
  end
end
