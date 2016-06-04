class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :rating
      t.string :category
      t.string :city
      t.timestamps null: false
    end
  end
end
