require 'active_support/configurable'

module MultitenantRoutes

  # Configures global settings
  def self.configure(&block)
    yield @config ||= MultitenantRoutes::Configuration.new
  end

  # Global settings
  def self.config
    @config
  end

  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :master_host
    config_accessor :isolated_parameter
    config_accessor :point_custom_domain

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  configure do |config|
    config.master_host = ENV['MASTER_HOST']
    config.isolated_parameter = nil
    config.point_custom_domain = false
  end
end