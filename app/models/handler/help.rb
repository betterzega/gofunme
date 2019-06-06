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
    if first_time_user?
      ":happynerd::happynerd: *WELCOME TO HOBBYLOBBY!* :happynerd::happynerd:\n" +
      "Tell us your interests, and we’ll match you with other Bettermenters that have similar interests!\n" +
      "\n*Here’s how to use it:*\n" +
      "- Let us know your interests by typing `/hobbylobby add _interest_`.\n" +
      "- If a slack channel of like-minded people already exists, you’ll be added to it; if it doesn’t, we’ll save your interests, and automatically create a channel for you when 2 other people express the same interests.\n" +
      "\n*Looking for some inspiration? Try these other fun commands:*\n" +
      "`/hobbylobby popular` : Get a list of the top interests\n" +
      "`/hobbylobby latest` : See the latest interests that were added\n" +
      "`/hobbylobby random` : See random interests\n" +
      "For more commands, type `/hobbylobby`\n" +
      "\n*Have Fun!!*\n"
    else
      "`#{text.split.first}` is *not* a valid command.\n" +
      "- To add an interest, use `/hobbylobby add _interest_` \n" +
      "- To see what interests someone has, use `/hobbylobby interests _slackname_` \n" +
      "- To see who else has the same interest, use `/hobbylobby people _interest_` \n" +
      "- To see a random interest, use `/hobbylobby random` \n" + 
      "- To see the latest subscribed interests, use `/hobbylobby latest` \n"
    end
  end

  def first_time_user?
    User.find_by(slack_user_id: user_id).blank?
  end
end
