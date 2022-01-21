# Load the Rails application.
require_relative "application"

# Load Envirnmental Variables.
ENV.update YAML.load_file('config/application.yml')[Rails.env] rescue {}

# Initialize the Rails application.
Rails.application.initialize!
