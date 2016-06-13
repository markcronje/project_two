class RenamingUserId < ActiveRecord::Migration
  def change
    change_table :venues do |t|
    t.integer :user_id
    end
  end
end
