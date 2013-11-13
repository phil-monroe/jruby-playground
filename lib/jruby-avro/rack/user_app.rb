module JrubyAvro
  module Rack
    class UserApp < Sinatra::Base
      helpers Sinatra::JSON
      enable :show_exceptions

      if development?
        register Sinatra::Reloader
        enable :reloader
      end

      get '/phil' do
        content_type 'application/json'

        phil = AvroSchemas::UserProfileRecord.new_builder
        phil.set_first_name 'Philip'
        phil.set_last_name  'Monroe'
        phil.set_first_job_start_date  Time.now.utc.iso8601

        phil.set_ids        []
        phil.set_jobs       []
        phil.set_educations []
        phil.set_locations  []
        phil.set_friend_ids []

        json phil.build
      end
    end
  end
end