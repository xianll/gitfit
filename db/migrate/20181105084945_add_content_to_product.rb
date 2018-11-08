class AddContentToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :content, :text
  end
end
