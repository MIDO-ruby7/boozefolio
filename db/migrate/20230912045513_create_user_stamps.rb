class CreateUserStamps < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stamps do |t|
      t.references :user, foreign_key: true
      t.references :stamp, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
