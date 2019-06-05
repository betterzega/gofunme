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

  def response_text
    if user.present? && interests.present?
      "#{username_text} has the following interests: #{interests.to_sentence}"
    elsif user.present?
      "#{username_text} does not have any interests :("
    else
      "#{username_text} is not found :("
    end
  end

  def username_text
    text.split.second
  end

  def user
    @user ||= User.find_by(slack_username: username_text)
  end

  def interests
    @interests ||= user.interests.map(&:name)
  end

  def interests
    user = User.find_or_create_by(slack_username: user_name, slack_user_id: user_id)
    Interest.where(user: user).pluck(:name)
  end

  def response_text
    "Your current interests: #{interests.join(' ')}"
  end
end
