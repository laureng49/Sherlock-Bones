class Dog < ActiveRecord::Base
  belongs_to :breed
  belongs_to :color
  belongs_to :user
  has_many :locations, dependent: :destroy

  validates :breed, :status, :gender, :size, :description, :date, :time, :age, presence: true
  validates :description, length: { maximum: 400 }
  validate :date_cannot_be_future

  def date_cannot_be_future
   if date > Date.today
     errors.add(:date, "Can't be in the future")
   end
  end

end
