class AddingColumnstoVenues < ActiveRecord::Migration
  def change
    change_table :venues do |t|
    t.string :comments
    t.references :users
    end
  end
end
