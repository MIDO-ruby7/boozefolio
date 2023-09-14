class CreateMessageStamps < ActiveRecord::Migration[7.0]
  def change
    create_table :message_stamps do |t|
      t.references :message, foreign_key: true
      t.references :stamp, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
