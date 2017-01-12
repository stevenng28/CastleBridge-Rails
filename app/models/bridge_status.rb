class BridgeStatus < ApplicationRecord
  validates :closed, presence: true
  validates :open, presence: true
  validates :closing, presence: true
  validates :opening, presence: true
end
