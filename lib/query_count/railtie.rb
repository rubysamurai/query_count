# https://api.rubyonrails.org/classes/Rails/Railtie.html
module QueryCount
  class Railtie < Rails::Railtie
    initializer 'query_count.initialize' do
      QueryCount::Counter.attach_to :active_record
      ActiveSupport.on_load(:action_controller) do
        include QueryCount::ControllerRuntime
      end
    end
  end
end
