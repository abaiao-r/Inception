#!/bin/bash

# Directories where the certificate and key should be
CERT_DIR="/etc/ssl/certs"
KEY_DIR="/etc/ssl/private"

# Check if the certificate and key exist
if [ ! -f "${CERT_DIR}/localhost.crt" ] || [ ! -f "${KEY_DIR}/localhost.key" ]; then
    # Generate a self-signed certificate and private key
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "${KEY_DIR}/localhost.key" -out "${CERT_DIR}/localhost.crt" -subj "/CN=localhost"
else
    # Get the certificate's expiration date
    EXPIRATION_DATE=$(openssl x509 -enddate -noout -in "${CERT_DIR}/localhost.crt" | cut -d= -f 2)

    # Convert the expiration date to a Unix timestamp
    EXPIRATION_DATE_TIMESTAMP=$(date -d "${EXPIRATION_DATE}" +%s)

    # Get the current date as a Unix timestamp
    CURRENT_DATE_TIMESTAMP=$(date +%s)

    # Calculate the number of days until the certificate expires
    DAYS_UNTIL_EXPIRATION=$(((EXPIRATION_DATE_TIMESTAMP - CURRENT_DATE_TIMESTAMP) / 86400))

    # If the certificate expires in less than 5 days, generate a new one
    if [ "${DAYS_UNTIL_EXPIRATION}" -lt 5 ]; then
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "${KEY_DIR}/localhost.key" -out "${CERT_DIR}/localhost.crt" -subj "/CN=localhost"
    fi
fi
