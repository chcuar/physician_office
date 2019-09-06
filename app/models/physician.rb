class Physician < ApplicationRecord
  has many :appointments
  has many :patients, :through => :appointments
end
