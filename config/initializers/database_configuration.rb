Rails.application.configure do
    config.active_record.default_database_url = ENV['DATABASE_URL']
end