# Project Title

## Description

This project involves setting up a load balancer using Nginx that routes traffic based on the geographical location of the user. The load balancer is configured to have one server for the UK, two servers for the US, and one server for the rest of the world. In case of any failure, all traffic is redirected to a backup server.

## Architecture

The project uses Docker and Nginx to create a robust and scalable architecture. Docker is used to containerize the Nginx servers, and Nginx is used as a reverse proxy and load balancer.

## Installation

To use this project, you need to have Docker and Docker Compose installed. You also need a MaxMind license key to download the GeoIP2 database.

## Usage

To start the application, run `docker-compose up` in the directory with the `docker-compose.yml` file. The application will be available at `http://localhost`.

## Health Check

The health check for each server is configured to run every 5 seconds. It uses `curl` to request the `/health` location on the server. If the health check fails 3 times in a row, the server is considered down and traffic is redirected to the backup server.

## Obtaining a MaxMind License Key

This project uses the GeoLite2 database from MaxMind to determine the geographical location of the user. To use this database, you need a MaxMind license key.

Follow these steps to obtain a license key:

1. Go to the [MaxMind sign up page](https://www.maxmind.com/en/geolite2/signup?utm_source=kb&utm_medium=kb-link&utm_campaign=kb-create-account).
2. Create a new account by filling in the required details and clicking on "Create Account".
3. After creating your account, sign in and navigate to "My License Key" under the "Services" section.
4. Click on "Generate new license key".
5. Provide a name for the license key and select "No" for the "Will this key be used for GeoIP Update?" question.
6. Click on "Confirm".
7. Your new license key will be displayed. Make sure to save it somewhere safe, as you won't be able to see it again.

Once you have your license key, you can use it to build the Docker image for this project by passing it as a build argument:

```bash
docker-compose build --build-arg MAXMIND_LICENSE_KEY=your_license_key
```