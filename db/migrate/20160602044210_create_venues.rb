class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :category
      t.integer :rating
      t.timestamps null: false
    end
  end
end
