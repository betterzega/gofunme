class Handler::Help
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def response
    {
      text: response_text
    }
  end

  def process
    true
  end

  private

  attr_reader :text

  def other_words
    text.split[1..]
  end

  def response_text
    "`#{text.split.first}` is *not* a valid command.\n" +
    "- To add an interest, use `/hobbylobby add _interest_` \n" +
    "- To see what interests someone has, use `/hobbylobby interests _slackname_` \n" +
    "- To see who else has the same interest, use `/hobbylobby people _interest_` \n" +
    "- To see a random interest, use `/hobbylobby random` \n"
    "- To see the latest subscribed interests, use `/hobbylobby latest` \n"
  end
end
