FROM nginx:latest

# Install dependencies for GeoIP2
RUN apt-get update && \
    apt-get install -y libmaxminddb0 libmaxminddb-dev mmdb-bin wget && \
    rm -rf /var/lib/apt/lists/*

# Set an ARG for the license key, which must be supplied at build time
ARG MAXMIND_LICENSE_KEY

# Download and install the GeoIP2 database using the license key
RUN wget -O GeoLite2-Country.tar.gz "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country&license_key=${MAXMIND_LICENSE_KEY}&suffix=tar.gz" && \
    tar -zxvf GeoLite2-Country.tar.gz -C /etc/nginx/ && \
    mv /etc/nginx/GeoLite2-Country_*/GeoLite2-Country.mmdb /etc/nginx/

COPY nginx.conf /etc/nginx/nginx.conf