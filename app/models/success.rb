class Success < ActiveRecord::Base
  belongs_to :user
  include Geokit::Geocoders
  geocoded_by :address
  after_validation :geocode
end
