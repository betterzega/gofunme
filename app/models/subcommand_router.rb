class SubcommandRouter
  def initialize(text:)
    @text = text
  end

  def handler
    case subcommand
    when 'test'
      Handler::Test.new(text: text)
    when 'add'
      Handler::AddInterest.new(text: text)
    when 'list'
      Handler::ListInterest.new(text: text)
    when 'people'
      Handler::ListPeople.new(text: text)
    end
  end

  private

  attr_reader :text

  def subcommand
    text.split.first
  end
end
