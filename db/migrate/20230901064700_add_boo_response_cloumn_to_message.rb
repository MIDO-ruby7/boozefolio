class AddBooResponseCloumnToMessage < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :content, :string, null: false
    add_column :messages, :boo_response, :string
  end
end
