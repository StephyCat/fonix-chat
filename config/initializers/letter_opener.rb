LetterOpener.configure do |config|
  # To overrider the location for message storage.
  # Default value is `tmp/letter_opener`
  config.location = Rails.root.join('tmp', 'letter_opener')

  # To render only the message body, without any metadata or extra containers or styling.
  # Default value is `:default` that renders styled message with showing useful metadata.
  # config.message_template = :light
  config.message_template = :default
end
