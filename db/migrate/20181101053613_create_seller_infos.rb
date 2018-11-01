class CreateSellerInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_infos do |t|
      t.text :biography
      t.string :instagram_username
      t.string :age_bracket
      t.string :gender
      t.string :lifestyle
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
