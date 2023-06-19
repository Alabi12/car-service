class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :service

  validates :date, presence: true
  validates :time, presence: true
end

