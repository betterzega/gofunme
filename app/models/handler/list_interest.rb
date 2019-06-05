class Handler::ListInterest
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    User.find_or_create_by(slack_username: user_name, slack_user_id: user_id)
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

  def interests
    user = User.find_or_create_by(slack_username: user_name, slack_user_id: user_id)
    Interest.where(user: user).pluck(:name)
  end

  def response_text
    "Your current interests: #{interests.join(' ')}"
  end
end
