class Handler::ListInterest
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    true
  end
  
  def response
    {
      text: other_words.join(" "),
      response_type: "in_channel" # add to make it visible to everyone in the channel
    }
  end

  private

  attr_reader :text

  def other_words
    text.split[1..]
  end
end
