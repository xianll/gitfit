class DropSellerInfo < ActiveRecord::Migration[5.2]
  def change
    drop_table :seller_info
  end
end
