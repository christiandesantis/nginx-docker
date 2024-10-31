# Nginx Docker Setup

This repository contains a Docker setup for running Nginx with custom configurations and environment variables.

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone the repository:

    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. Copy the `.env.example` file to `.env` and adjust the variables accordingly:

    ```sh
    cp .env.example .env
    ```

    Edit the `.env` file to set the appropriate values for your environment:

    ```env
    SSL_CERT=/path/to/your/fullchain.pem
    SSL_KEY=/path/to/your/privkey.pem
    MAIN_DIST=/path/to/your/dist
    ```

3. Make the `./reload.sh` and `./restart.sh` scripts executable:

    ```sh
    chmod +x reload.sh restart.sh
    ```

## Usage

### Build and Start the Containers

To build and start the Nginx container, run:

```sh
docker compose up --build -d
```

### Reload Nginx Configuration

To reload the Nginx configuration inside the container, run:

```sh
./reload.sh
```

### Restart Nginx

To restart Nginx inside the container, run:

```sh
./restart.sh
```

### Stop the Containers

To stop the Nginx container, run:

```sh
docker compose down
```

## File Structure

- `.env`: Environment variables file.
- `.env.example`: Example environment variables file.
- `docker-compose.yml`: Docker Compose configuration file.
- `Dockerfile`: Dockerfile for building the Nginx image.
- `nginx.conf`: Custom Nginx configuration file.
- `reload.sh`: Script to reload Nginx configuration inside the container.
- `restart.sh`: Script to restart Nginx inside the container.

## Volumes

The following volumes are mounted in the Nginx container:

- `./nginx.conf:/etc/nginx/conf.d/default.conf:ro`: Custom Nginx configuration file.
- `/var/www:/var/www:ro`: Web root directory.
- `${HOME-/home}:/home/user:ro`: Home directory.
- `${MAIN_DIST-/usr/share/nginx/html}:/usr/share/nginx/html:ro`: Distribution directory.
- `${SSL_CERT}:/etc/ssl/certs/fullchain.pem:ro`: SSL certificate.
- `${SSL_KEY}:/etc/ssl/private/privkey.pem:ro`: SSL private key.

## Networks

The Nginx container is connected to the `nginx-network` network.

## Ports

The following ports are exposed:

- `80:80`: HTTP
- `443:443`: HTTPS

## License

This project is licensed under the MIT License.