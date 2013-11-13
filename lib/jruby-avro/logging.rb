module JrubyAvro
  module Logging
    PATTERN   = '%5l | %d | %C | %m'
    FORMATTER = Log4r::PatternFormatter.new(pattern: PATTERN)

    # To work with Modules/Classess and Instances with just `include Logging`
    def self.included other
      other.extend Logging
    end

    def logger
      return @logger if @logger
      @logger_name ||= self.is_a?(Module) ? self.name : self.class.name
      @logger      ||= Log4r::Logger[@logger_name]
      return @logger if @logger

      @logger = Log4r::Logger.new @logger_name
      outputter = Log4r::Outputter.stdout
      outputter.formatter = FORMATTER
      @logger.outputters = outputter
      @logger
    end
  end
end