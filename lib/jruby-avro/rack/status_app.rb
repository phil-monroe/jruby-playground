module JrubyAvro
  module Rack
    class StatusApp < Sinatra::Base
      get '/' do
        'OK'
      end
    end
  end
end