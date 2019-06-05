class Handler::ListPeople
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    true
  end

  def response
    {
      text: response_text
    }
  end

  private

  attr_reader :text

  def interest_text
    text.split.second
  end

  def response_text
    if interests.count == 0
      "Sorry, no one is interested in this topic :("
    else
      "The following people have an interest in #{interest_text}: #{usernames}"
    end
  end

  def interests
    @interests ||= Interest.where(name: interest_text)
  end

  def usernames
    @usernames ||= interests.map(&:user).map(&:slack_username).to_sentence
  end
end
