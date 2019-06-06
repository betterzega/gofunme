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
    "Top ten interests: `#{popular_interests.join(' ')}`"
  end

  def popular_interests
    @random_interest ||= Interest.group(:name).order("COUNT(Interest.name)").last(10).pluck(:name)
  end
end
