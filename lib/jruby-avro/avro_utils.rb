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

