# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You Under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ---- Build stage (Maven + JDK) ----
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /work
COPY . .

# Build only what we need (skip tests + skip javadoc + skip rat)
RUN mvn -q -DskipTests -Dmaven.javadoc.skip=true -Drat.skip=true package

# ---- Runtime stage (JRE only) ----
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy compiled classes + produced library jar
COPY --from=build /work/target/classes /app/classes
COPY --from=build /work/target/commons-lang3-*-SNAPSHOT.jar /app/commons-lang3.jar

# Run demo app using classpath (no executable jar needed)
ENTRYPOINT ["java", "-cp", "/app/classes:/app/commons-lang3.jar", "org.apache.commons.lang3.demo.App"]
