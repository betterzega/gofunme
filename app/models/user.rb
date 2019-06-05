class User < ApplicationRecord
  has_many :interests

  def self.find_or_create_from_slack!(slack_user_id:, slack_username:)
    User.find_by(slack_user_id: slack_user_id) || User.create!(slack_user_id: slack_user_id, slack_username: slack_username)
  end
end
