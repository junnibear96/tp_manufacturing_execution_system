# Stage 1: Build
FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /build

# Copy Maven wrapper and pom.xml
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Download dependencies (cached layer)
RUN ./mvnw dependency:go-offline

# Copy source code
COPY src/ ./src/

# Build application (skip tests for faster build)
RUN ./mvnw clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-jammy

# Install curl for healthcheck
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy wallet files (required for Oracle Cloud connection)
COPY wallet/ /app/wallet/

# Copy JAR from build stage
COPY --from=build /build/target/TP-exec.jar /app/app.jar

# Set Oracle wallet environment variables
ENV TNS_ADMIN=/app/wallet
ENV ORACLE_NET_TNS_ADMIN=/app/wallet

# Expose port (Railway will override with PORT env var)
EXPOSE 8090

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:${PORT:-8090}/actuator/health || exit 1

# Run application
ENTRYPOINT ["java"]
CMD ["-Xmx1g", "-Xms512m", "-jar", "app.jar"]
