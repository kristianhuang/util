#!/bin/bash

sudo cd ../build \
    && docker-compose -p "${project-name}" up -d