class AddLatitudeAndLongitudeToCrib < ActiveRecord::Migration
  def change
    add_column :cribs, :latitude, :float
    add_column :cribs, :longitude, :float
  end
end
