module JrubyAvro
  module Rack
    class UserApp < Sinatra::Base
      get '/phil' do
        phil = AvroSchemas::UserProfileRecord.new_builder
        phil.set_first_name 'Phil'
        phil.set_last_name  'Monroe'
        phil.set_first_job_start_date  Time.now.utc.iso8601

        phil.set_ids        []
        phil.set_jobs       []
        phil.set_educations []
        phil.set_locations  []
        phil.set_friend_ids []

        AvroUtils.avro_to_json phil.build
      end
    end
  end
end