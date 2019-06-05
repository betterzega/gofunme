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
    "#{other_words.join(' ')} is not a valid command, valid commands are: #{commands.join(' ')}"
  end

  def commands
    ['test', 'add', 'people', 'interests', 'random']
  end
end
