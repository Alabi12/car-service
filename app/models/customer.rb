class Customer < ApplicationRecord
    belongs_to :user
    has_many :bookings

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true
end
