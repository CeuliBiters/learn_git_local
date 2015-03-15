require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "71dc31e1d2497c5c538e26fa2038e3f1ee7688b0b79364ae26be1b9a3baf80ba"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
