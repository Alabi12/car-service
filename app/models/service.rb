class Service < ApplicationRecord
    belongs_to :user
    has_many :bookings
  
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :duration, presence: true, numericality: { greater_than: 0 }
  end
  
