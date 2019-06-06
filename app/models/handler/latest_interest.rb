class Handler::LatestInterest
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
    "Latest top interests are: #{interests.join(', ')}"
  end

  def interests
    @interests ||= Interest.order(created_at: :desc).limit(5).pluck(:name).uniq
  end
end
