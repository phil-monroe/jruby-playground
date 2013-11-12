require 'jruby-avro/rack/status_app'
require 'jruby-avro/rack/user_app'
require 'rack/logger'
require 'rack/commonlogger'

module JrubyAvro
  class Server
    attr_accessor :app, :server, :host, :port

    def initialize
      self.host, self.port = '0.0.0.0', 8080

      self.app = ::Rack::Builder.new do
        use ::Rack::CommonLogger
        map '/status' do
          run JrubyAvro::Rack::StatusApp.new
        end

        map '/user' do
          run Rack::UserApp.new
        end
      end

      self.server = ::Puma::Server.new(app)
      server.add_tcp_listener @host, @port
    end

    def start
      puts "Starting server on #{host}:#{port}"
      server.run
    end

    def stop
      puts "Stopping Server"
      server.stop(true)
    end
  end
end