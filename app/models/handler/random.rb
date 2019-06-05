class Handler::Random
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

  def response_text
    "a random interest"
  end
end
