class Location < ActiveRecord::Base
  belongs_to :dog
  belongs_to :user
  acts_as_mappable

  validates :user_id, :dog_id, :address, presence: true

  include Geokit::Geocoders
    geocoded_by :address
    after_validation :geocode
end
