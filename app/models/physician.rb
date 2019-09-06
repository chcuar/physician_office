class Physician < ApplicationRecord
  validates :name, :specialty, presence: true
  has many :appointments
  has many :patients, through: :appointments
end
