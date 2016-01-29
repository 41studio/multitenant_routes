# MultitenantRoutes

Isolate your routes beetwen master routes and tenant routes

## Setup

Add to your gemfile and bundle install
```
gem 'multitenant_routes'
```

Install config file
```
rails g multitenant_routes:config
```
Will generate new file *config/initializers/multitenant_routes_config.rb*
```ruby
MultitenantRoutes.configure do |config|
  config.master_host = ENV['MASTER_HOST']
  config.point_custom_domain = false # default false
  config.isolated_parameter = nil # default nil
end
```

## Example Use Case + Usage
```ruby
# Master URL        : http://myapp.com
# Tenant URL        : http://test_tenant_1.myapp.com
# Tenant Own Domain : http://tenant.com (he pointing the dns to http://test_tenant_1.myapp.com)

Rails.application.routes.draw do

  constraints MultitenantRoutes::Tenant do
    # this routes only avaiable when user access :
    # - Tenant URL http://test_tenant_1.myapp.com
    # - Tenant Own Domain http://tenant.com (if point_custom_domain = true)
    # - Master URL with isolated_parameter http://myapp.com?tenant_id=1 (if isolated_parameter = :tenant_id)
    root "page#index", as: :page_root # need use as: option because we cant add two root method
    get 'page/portfolio'
    get 'page/contact'
  end

  constraints MultitenantRoutes::Master do
    # this routes only avaiable when user acess your app with URL => http://myapp.com
    resources :websites
    devise_for :users
    root 'home#index'
  end

end

```

## Configuration
**config.master_host (Required)**
=> Master host url, you need fill this config.

**config.point_custom_domain**
=> Set true, if your app support pointing domain to tenant subdomain.

**config.isolated_parameter**
=> Trigger tenant routes by parameter


## Next To-Do - contributions would be appreciated :) also request new feature welcome
* Test


## Contributing

1. Fork it ( https://github.com/41studio/multitenant_routes/fork )
2. Create your feature branch (`git checkout -b new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin new-feature`)
5. Create a new Pull Request

This project rocks and uses MIT-LICENSE.
