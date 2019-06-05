require "slack"

Slack.configure do |config|
  config.token = ENV["SLACK_OATH_TOKEN"]
end

Slack.auth_test
