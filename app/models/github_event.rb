class GithubEvent
  attr_reader :id, :type, :repo, :actor

  def initialize(attributes = {})
    @id = attributes[:id]
    @type = attributes[:type]
    @actor = attributes[:actor]
    @repo = attributes[:repo]
  end

  def self.for_user(token)
    raw_profile = GithubService.new(token).events.map do |raw_event|
      GithubEvent.new(raw_event)
    end
  end
end
