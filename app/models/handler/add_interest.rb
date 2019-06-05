class Handler::AddInterest
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    user = User.find_or_create_by(slack_username: user_name, slack_user_id: user_id)
    Interest.find_or_create_by(user: user, name: other_words)
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
      "#{} has a similar interest of #{interest} as you!"
    elsif creating_channel_for_interest?
      "There are a lot of people with a similar interest! Creating a channel for everyone to chat!"
    else
      "There is a channel for #{interest}! Adding you to the channel!"
    end
  end

  def only_person_with_interest?

  end

  def two_people_with_interest?

  end

  def creating_channel_for_interest?
    
  end

  def interest
    text.split[1..]
  end
end
