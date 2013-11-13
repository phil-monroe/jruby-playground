module JrubyAvro
  class Worker
    include Logging

    def initialize
      @stop_work = false
    end

    def start
      logger.info 'Starting Worker'
      @worker = Thread.new do
        loop do
          break if @stop_work
          logger.info "Doin' Work"
          sleep 5
        end
      end
    end

    def stop
      logger.info "Stopping Worker"
      @stop_work = true
      join
    end

    def join
      @worker.join
    end

  end
end