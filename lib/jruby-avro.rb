
Bundler.require(:default)

require 'jruby-avro/logging'
require 'jruby-avro/avro_utils'
require 'jruby-avro/server'
require 'jruby-avro/worker'


module JrubyAvro
  extend self
  include Logging

  def run
    Signal.trap 'SIGINT',  method(:stop)
    Signal.trap 'SIGTERM', method(:stop)

    @server = Server.new
    @server.start

    @worker = Worker.new
    @worker.start
    @worker.join
  end


  def stop
    logger.info "Shutting Down Jruby-Avro"
    @server.stop
    @worker.stop
  end



end

JrubyAvro.run
