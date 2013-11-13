require 'jruby-avro/rack/status_app'
require 'jruby-avro/rack/user_app'
require 'jruby-avro/rack/request_logger'

module JrubyAvro
  class Server
    include Logging

    attr_accessor :app, :server, :host, :port

    def initialize
      self.host, self.port = '0.0.0.0', 8080

      self.app = ::Rack::Builder.new do
        use Rack::RequestLogger
        map '/status' do
          run Rack::StatusApp
        end

        map '/user' do
          run Rack::UserApp
        end
      end

      self.server = ::Puma::Server.new(app)
      server.add_tcp_listener @host, @port
    end

    def start
      logger.info "Starting server on #{host}:#{port}"
      server.run
    end

    def stop
      logger.info "Stopping Server"
      server.stop(true)
    end
  end
end