class AddUniqueUserIdToProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_index :profiles, :user_id
    add_index :profiles, :user_id, unique: true
  end
end
