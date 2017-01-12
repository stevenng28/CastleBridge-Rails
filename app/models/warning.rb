class Warning < ApplicationRecord
  validates :status, presence: true
  validates :minutes_open, presence: true
end
