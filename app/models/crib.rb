class Crib < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{self.street} #{self.city} #{self.state} #{self.zip}"
  end
end
