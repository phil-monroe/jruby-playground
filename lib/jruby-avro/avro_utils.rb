module AvroSchemas
  import com.identified.data.avroschema
end

module AvroUtils
  java_import java.io.ByteArrayOutputStream
  java_import org.apache.avro.io.EncoderFactory
  java_import org.apache.avro.io.DecoderFactory
  java_import org.apache.avro.specific.SpecificDatumWriter
  java_import org.apache.avro.specific.SpecificDatumReader

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

class Java::OrgApacheAvroSpecific::SpecificRecordBase
  def to_json opts={}
    AvroUtils.avro_to_json self
  end

  def self.from_json json
    AvroUtils.json_to_avro json, self.get_class_schema
  end
end