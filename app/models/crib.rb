class Crib < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    street.to_s + ', ' + city.to_s + ', ' + state.to_s + ', ' + zip.to_s
    # "#{self.street} #{self.city} #{self.state} #{self.zip}"
  end
end
