class SlackMessage
  CURL = "curl -X POST --data-urlencode"
  URL  = "https://hooks.slack.com/services/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"

  def initialize(options = {})
    @username   = options.fetch(:username, "webhookbot")
    @message    = options.fetch(:message, "This is a test")
    @icon_emoji = options.fetch(:icon, ":ghost:")
  end

  def send
    data = %{ 'payload={ \
                    "group": "#super-secret-rails", \
                    "username": "#{@username}", \
                    "text": "#{@message}", \
                    "icon_emoji": "#{@icon_emoji}" \
                }' }

    command = " #{CURL} #{data} #{URL} "
    system(command)
  end
end

SlackMessage.new({ username: 'Justin', message: 'Straight from Ruby!' }).send
SlackMessage.new({ username: 'Sushi', message: 'Time for lunch!', icon: ':sushi:' }).send

#curl -X POST --data-urlencode 'payload={"group": "#super-secret-rails", "username": "webhookbot", "text": "This is a test", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/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
