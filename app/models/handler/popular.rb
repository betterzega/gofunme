class Handler::Popular
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
    "Top ten interests: `#{popular_interests.join(', ')}`"
  end

  def popular_interests
    @random_interest ||= Interest.select(“name, COUNT(user_id) as num”).group(:name).order(“num”).last(10).pluck(:name)
  end
end
