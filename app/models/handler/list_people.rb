class Handler::ListPeople
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    true
  end

  def response
    {
      text: other_words.join(" ")
    }
  end

  private

  attr_reader :text

  def other_words
    text.split[1..]
  end
end
