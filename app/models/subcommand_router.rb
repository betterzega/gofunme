class SubcommandRouter
  def initialize(text:)
    @text = text
  end

  def handler_class
    case subcommand
    when 'test'
      Handler::Test
    when 'add'
      Handler::AddInterest
    when 'people'
      Handler::ListPeople
    when 'interests'
      Handler::ListInterest
    when 'random'
      Handler::Random
    else
      Handler::Help
    end
  end

  private

  attr_reader :text

  def subcommand
    text.split.first
  end
end
