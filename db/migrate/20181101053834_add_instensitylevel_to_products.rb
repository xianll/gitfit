class AddInstensitylevelToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :intensity_level, :string
  end
end
