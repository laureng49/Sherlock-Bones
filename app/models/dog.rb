class Dog < ActiveRecord::Base
  belongs_to :breed
  belongs_to :color
  belongs_to :user
  has_many :locations

  validates :breed, :color, :status, :gender, :size, :description, :date, :time, :age, presence: true
  validates :description, length: { minimum: 100 }
  validate :date_cannot_be_future

  def date_cannot_be_future
   if date > Date.today
     errors.add(:date, "Can't be in the future")
   end
  end

end
