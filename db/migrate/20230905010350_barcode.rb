class Barcode < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :jan_code, :string
  end
end
