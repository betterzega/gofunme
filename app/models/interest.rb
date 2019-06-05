class Interest < ApplicationRecord
  has_and_belongs_to_many :slack_groups
  belongs_to :user
end
