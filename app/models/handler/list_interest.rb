class Handler::ListInterest
  include ActiveModel::Model

  attr_accessor :user_name, :user_id, :text

  def process
    true
  end

  def response
    {
      text: interest_text.join(" ")
    }
  end

  private

  attr_reader :text

  def interest_text
    text.split[1..]
  end

  def interest
    @interest
  end
end
