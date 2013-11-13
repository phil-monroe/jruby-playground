module JrubyAvro
  module Rack
    class RequestLogger < ::Rack::CommonLogger
      include Logging

      FORMAT = %{%s - %s "%s %s%s %s" %d %s %0.4f}

      def initialize app
        @app = app
      end

      def log(env, status, header, began_at)
        now = Time.now
        length = extract_content_length(header)
        logger_method = status < 400 ? :info : :warn

        logger.send logger_method, FORMAT % [
          env['HTTP_X_FORWARDED_FOR'] || env["REMOTE_ADDR"] || "-",
          env["REMOTE_USER"] || "-",
          env["REQUEST_METHOD"],
          env["PATH_INFO"],
          env["QUERY_STRING"].empty? ? "" : "?"+env["QUERY_STRING"],
          env["HTTP_VERSION"],
          status.to_s[0..3],
          length,
          now - began_at
        ]
      end
    end
  end
end