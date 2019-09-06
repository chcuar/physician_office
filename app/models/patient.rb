class Patient < ApplicationRecord
  validates :name, :age, presence: true
  has many :appointments
  has many :physicians, through: :appointments
end
