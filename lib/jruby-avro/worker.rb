module JrubyAvro
  class Worker

    def initialize
      @stop_work = false
    end

    def start
      puts 'Starting Worker'
      @worker = Thread.new do
        loop do
          break if @stop_work
          puts "Doin' Work"
          sleep 5
        end
      end
    end

    def stop
      puts "Stopping Worker"
      @stop_work = true
      join
    end

    def join
      @worker.join
    end

  end
end