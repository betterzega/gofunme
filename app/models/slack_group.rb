class SlackGroup < ApplicationRecord
  has_and_belongs_to_many :interests
  has_many :events
  has_one :leader
end
