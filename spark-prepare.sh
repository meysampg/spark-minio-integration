#!/usr/bin/bash

HADOOP_AWS_VERSION="3.3.2"
AWS_SDK_VERSION="1.11.1034"
GUAVA_VERSION="14.0.1"

SPARK_PATH="/opt/bin/spark"
if [ ! -z "$SPARK_HOME" ]; then
    SPARK_PATH="$SPARK_HOME"
fi

CONF_PATH="$SPARK_PATH/conf"
JAR_PATH="$SPARK_PATH/jars"

if [ ! -f "$JAR_PATH/guava-$GUAVA_VERSION.jar" ]; then
    rm $JAR_PATH/guava-*.jar
    wget -P $JAR_PATH https://repo1.maven.org/maven2/com/google/guava/guava/$GUAVA_VERSION/guava-$GUAVA_VERSION.jar
fi

if [ ! -f "$JAR_PATH/hadoop-aws-$HADOOP_AWS_VERSION.jar" ]; then
    rm $JAR_PATH/hadoop-aws-*.jar
    wget -P $JAR_PATH https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_AWS_VERSION/hadoop-aws-$HADOOP_AWS_VERSION.jar
fi

if [ ! -f "$JAR_PATH/aws-java-sdk-bundle-$AWS_SDK_VERSION.jar" ]; then
    rm $JAR_PATH/aws-java-sdk-bundle-*.jar
    wget -P "$JAR_PATH/" https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/$AWS_SDK_VERSION/aws-java-sdk-bundle-$AWS_SDK_VERSION.jar
fi

cat core-site.xml > "$CONF_PATH/core-site.xml"
cat spark-defaults.conf >> "$CONF_PATH/spark-defaults.conf"
