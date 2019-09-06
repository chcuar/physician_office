class Patient < ApplicationRecord
  has many :appointments
  has many :physicians, :through => :appointments
end
