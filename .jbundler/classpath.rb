JBUNDLER_CLASSPATH = []
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/org/apache/avro/avro/1.7.5/avro-1.7.5.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/org/codehaus/jackson/jackson-core-asl/1.9.13/jackson-core-asl-1.9.13.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/org/codehaus/jackson/jackson-mapper-asl/1.9.13/jackson-mapper-asl-1.9.13.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/com/thoughtworks/paranamer/paranamer/2.3/paranamer-2.3.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/org/xerial/snappy/snappy-java/1.0.5/snappy-java-1.0.5.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/org/apache/commons/commons-compress/1.4.1/commons-compress-1.4.1.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/org/tukaani/xz/1.0/xz-1.0.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/org/slf4j/slf4j-api/1.6.4/slf4j-api-1.6.4.jar'
JBUNDLER_CLASSPATH << '/Users/phil/.m2/repository/com/identified/data/avro-schemas/0.0.1-SNAPSHOT/avro-schemas-0.0.1-SNAPSHOT.jar'
JBUNDLER_CLASSPATH.freeze
JBUNDLER_CLASSPATH.each { |c| require c }
