class Page::Home
  def initialize(user:)
    @user = user
  end

  def soonest_events
    Array.new
  end

  def newest_events
    Array.new
  end

  def nearly_filled_events
    Array.new
  end

  def related_events
    Array.new
  end

  private

  attr_reader :user
end
