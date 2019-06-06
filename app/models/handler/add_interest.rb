class Handler::AddInterest
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    user
    interest
    channel
    invite
    true
  end

  def response
    {
      text: response_text
    }
  end

  private

  attr_reader :text

  def other_words
    text.split[1..]
  end

  def response_text
    if only_person_with_interest?
      "You are the first person with this interest! Add more interests to find others like you!"
    elsif two_people_with_interest?
      "#{users_with_similar_interests.first.user.slack_username} has a similar interest of #{interest_text} as you!"
    elsif three_people_with_interest?
      "There are a lot of people with a similar interest! Creating a channel for everyone to chat!"
    else
      "There is a channel for #{interest_text}! Adding you to the channel!"
    end
  end

  def only_person_with_interest?
    users_with_similar_interests.count == 0
  end

  def two_people_with_interest?
    users_with_similar_interests.count == 1
  end

  def three_people_with_interest?
    users_with_similar_interests.count == 2
  end

  def interest_text
    text.split.second
  end

  def users_with_similar_interests
    @users_with_similar_interests_count ||= Interest.where(name: interest_text).where.not(user_id: user.id)
  end

  def invite
    return unless users_with_similar_interests.count > 2
    slack_client = Slack::Client.new
    @invite ||= slack_client.channels_invite(channel: channel.slack_channel_id, user: user.slack_user_id)
  end

  def channel
    return unless users_with_similar_interests.count > 1
    @channel ||= SlackGroup.find_or_create_by!(name: interest_text, interest: interest_text)
  end

  def user
    @user ||= User.find_or_create_from_slack!(slack_user_id: user_id, slack_username: user_name)
  end

  def interest
    @interest ||= user.interests.find_or_create_by!(name: interest_text)
  end
end
