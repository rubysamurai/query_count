# https://api.rubyonrails.org/classes/ActiveRecord/LogSubscriber.html
require 'active_support'

module QueryCount
  class Counter < ActiveSupport::LogSubscriber
    IGNORE_PAYLOAD_NAMES = %w[SCHEMA EXPLAIN].freeze

    def self.counter=(value)
      Thread.current['query_count'] = value
    end

    def self.counter
      Thread.current['query_count'] ||= 0
    end

    def self.counter_cache=(value)
      Thread.current['query_count_cache'] = value
    end

    def self.counter_cache
      Thread.current['query_count_cache'] ||= 0
    end

    def self.reset_counter
      rc = counter
      self.counter = 0

      rc
    end

    def self.reset_counter_cache
      rcc = counter_cache
      self.counter_cache = 0

      rcc
    end

    def sql(event)
      payload = event.payload

      return if IGNORE_PAYLOAD_NAMES.include?(payload[:name])

      if payload[:cached]
        self.class.counter_cache += 1
      else
        self.class.counter += 1
      end
    end
  end
end
