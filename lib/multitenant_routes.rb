require 'multitenant_routes/config'

module MultitenantRoutes
  class Tenant
    def self.matches?(request)
      conditions = ["request.subdomain.present?"]

      if MultitenantRoutes.config.isolated_parameter
        conditions << "request.query_parameters['#{MultitenantRoutes.config.isolated_parameter}'].present?"
      end

      if MultitenantRoutes.config.point_custom_domain
        conditions << "!request.host_with_port.eql?(MultitenantRoutes.config.master_host)"
      end

      eval(conditions.join(' || '))
    end
  end

  class Master
    def self.matches?(request)
      conditions = ["request.host_with_port.eql?(MultitenantRoutes.config.master_host)"]

      if MultitenantRoutes.config.isolated_parameter
        conditions << "request.query_parameters['#{MultitenantRoutes.config.isolated_parameter}'].blank?"
      end

      eval(conditions.join(' && '))
    end
  end
end