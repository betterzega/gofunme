class Handler::Test
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    true
  end

  def response
    {
      text: "- To see who else has the same interest, use `/hobbylobby people _interest_` \n - To see the latest subscribed interests, use `/hobbylobby latest`"
    }
  end

  private

  attr_reader :text

  def other_words
    text.split[1..]
  end
end
