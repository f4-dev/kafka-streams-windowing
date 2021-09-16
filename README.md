# kafka-streams-windowing
Example of buffering events on a windowing function

## Prerequisites
* java 8+
* gradle
* docker-compose

## Setup
```

```


## Running

### 1. Start with docker-compose
```
docker-compose up -d
```

### 2. Compile and start the Kafka Stream processor
```
./gradlew build
java -Dconfig.file=configuration/dev.properties -jar build/libs/aggregating-average-standalone-0.0.1.jar
```

### 3. Start producer
```
docker exec -i schema-registry /usr/bin/kafka-avro-console-producer --topic ratings --bootstrap-server broker:9092 \
    --property "parse.key=false" \
    --property "key.separator=:" \
    --property value.schema="$(< src/main/avro/rating.avsc)"
```

### 4. Send some data to the producer stdin
```
{"movie_id":362,"rating":8}
{"movie_id":362,"rating":5}
{"movie_id":362,"rating":10}
{"movie_id":362,"rating":7}
{"movie_id":362,"rating":5}
{"movie_id":362,"rating":2}
{"movie_id":362,"rating":9}
```

### 5. See the output aggregated into a list of value on the Stream processor stdout
```
================                                                                                                                           
8.0                                                                                                                                        
================                                                                                                                           
8.0,5.0                                                                                                                                    
================                                                                                                                           
8.0,5.0,10.0                                                                                                                               
================                                                                                                                           
8.0,5.0,10.0,7.0                                                                                                                           
================                                                                                                                           
8.0,5.0,10.0,7.0,5.0                                                                                                                       
================                                                                                                                           
8.0,5.0,10.0,7.0,5.0,2.0                                                                                                                   ================                                                                                                                           
8.0,5.0,10.0,7.0,5.0,2.0,9.0  
```

NOTE: `suppress()` is not working as expected, that's why we see many outputs. But basically here we see how I can aggregate events for later processing all at once.

### References

https://kafka-tutorials.confluent.io/aggregating-average/kstreams.html