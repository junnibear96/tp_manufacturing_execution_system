FROM openjdk:17-slim

# Install curl for healthcheck
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy wallet files (required for Oracle Cloud connection)
COPY wallet/ /app/wallet/

# Copy application JAR
COPY target/TP-exec.jar /app/app.jar

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
