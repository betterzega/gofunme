class SlackGroup < ApplicationRecord
  has_and_belongs_to_many :interests, primary_key: :name, foreign_key: :name
  has_many :events
  has_one :leader

  before_create :create_remote_group

  private

  def create_remote_group
    slack_client = Slack::Client.new
    response = slack_client.channels_create(name: name)
    self.slack_channel_id = response["channel"]["id"]
  end
end
