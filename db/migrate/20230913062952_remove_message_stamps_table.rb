class RemoveMessageStampsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :message_stamps
  end
end
