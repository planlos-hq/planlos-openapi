#!/usr/bin/env bash
# Fuzz a running planlos-server against openapi.yaml with Schemathesis.
# Usage: ./run_tests.sh [API_URL]   (default: local server)
set -euo pipefail

url="${1:-http://localhost:8004/api/v1/}"

if ! command -v uvx &>/dev/null; then
  echo "uv not found: use the Nix shell (direnv allow / nix develop) or install uv." >&2
  exit 1
fi

uvx schemathesis run openapi.yaml --url "$url"
