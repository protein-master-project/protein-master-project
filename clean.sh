#!/usr/bin/env bash
#
# clean.sh
#
# This script cleans the project by removing build artifacts,
# cache files, and temporary directories generated in the backend
# and frontend parts of the project.

# 1. Clean Python backend artifacts
echo "Cleaning Python backend artifacts..."
# Remove __pycache__ directories, .pyc files, and pytest cache folders
find ./backend -type d -name "__pycache__" -exec rm -rf {} +
find ./backend -type f -name "*.pyc" -exec rm -f {} +
find ./backend -type d -name ".pytest_cache" -exec rm -rf {} +
# If there are build or distribution directories, you can add:
# rm -rf ./backend/build ./backend/dist

# 2. Clean frontend build artifacts
echo "Cleaning frontend build artifacts..."
# Remove build or distribution directories for the frontend
rm -rf ./frontend/build
rm -rf ./frontend/dist
# Optionally, remove node_modules directory (if you need a fresh install)
rm -rf ./frontend/node_modules

# Optionally, remove other cache directories (e.g., for Gatsby or similar frameworks)
# rm -rf ./frontend/.cache

echo "Clean finished!"
