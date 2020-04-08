#!/bin/bash

CWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

which docker >/dev/null || {
  echo "ERROR: Please install Docker first."
  exit 1
}

echo "===== BUILDING =====" && \
  docker build -t gatsbyjs . && \
  echo "===== RUNNING =====" && \
  docker run --rm -t -i \
    -p 8000:8000 \
    -v ${CWD}:/code \
    -w /code \
    gatsbyjs \
    bash
