class AddedVenueId < ActiveRecord::Migration
  def change
    add_column :venues, :venueID, :string
  end

end
