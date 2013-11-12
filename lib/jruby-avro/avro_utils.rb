module AvroSchemas
  import com.identified.data.avroschema
end

module AvroUtils
  ByteArrayOutputStream ||= java.io.ByteArrayOutputStream
  EncoderFactory        ||= org.apache.avro.io.EncoderFactory
  DecoderFactory        ||= org.apache.avro.io.DecoderFactory
  SpecificDatumWriter   ||= org.apache.avro.specific.SpecificDatumWriter
  SpecificDatumReader   ||= org.apache.avro.specific.SpecificDatumReader

  class << self
    def avro_to_json obj
      out    = ByteArrayOutputStream.new
      enc    = EncoderFactory.get.jsonEncoder(obj.get_schema, out)
      writer = SpecificDatumWriter.new(obj.get_schema)
      writer.write(obj, enc)
      enc.flush
      out.toString
    end

    def json_to_avro(json, schema)
      dec    = DecoderFactory.get.jsonDecoder(schema, json)
      reader = SpecificDatumReader.new(schema)
      reader.read(nil, dec);
    end
  end
end

# builder = AvroSchemas::UserProfileRecord.new_builder
# builder.set_first_name 'Phil'
# builder.set_last_name  'Monroe'
# builder.set_ids        []
# builder.set_jobs       []
# builder.set_educations []
# builder.set_locations  []
# builder.set_friend_ids []
#
# me = builder.build
#
# me_json = AvroUtils.avro_to_json me
#
# me2 = AvroUtils.json_to_avro me_json, AvroSchemas::UserProfileRecord.get_class_schema
#
# puts me.to_string
# puts me2.to_string