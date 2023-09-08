Rails.application.configure do
    config.active_record.default_shard = ENV['postgresql://postgres:wSP7t6x7nEJKJT5RlCGO@containers-us-west-34.railway.app:7323/railway']
end