MultitenantRoutes.configure do |config|
  config.master_host = ENV['MASTER_HOST']
  config.point_custom_domain = false # default false
  config.isolated_parameter = nil # default nil
end