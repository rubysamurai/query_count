# https://github.com/rails/rails/blob/master/activerecord/lib/active_record/railties/controller_runtime.rb
module QueryCount
  module ControllerRuntime
    extend ActiveSupport::Concern

    module ClassMethods
      def log_process_action(payload)
        messages    = super
        count       = payload[:query_count]
        count_cache = payload[:query_count_cache]

        messages.push(
          "SQL Queries: #{count + count_cache}"\
          " (#{count_cache} cached)"
        )

        messages
      end
    end

    private

      def process_action(action, *args)
        Counter.reset_counter
        Counter.reset_counter_cache
        super
      end

      def append_info_to_payload(payload)
        super
        return unless ActiveRecord::Base.connected?

        payload[:query_count] = Counter.reset_counter
        payload[:query_count_cache] = Counter.reset_counter_cache
      end
  end
end
