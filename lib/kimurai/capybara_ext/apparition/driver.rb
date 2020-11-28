require_relative '../driver/base'

module Capybara::Apparition
  class Driver
    def pid
      @pid ||= `lsof -i tcp:#{port} -t`.strip.to_i
    end

    def port
      @port ||= browser.client.instance_variable_get("@ws").instance_variable_get("@driver").instance_variable_get("@socket").instance_variable_get("@io").remote_address.inspect_sockaddr.split(':').last
    end
  end
end
