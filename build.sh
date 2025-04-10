#!/usr/bin/env bash

############################################
# 1. Initialize and update Git submodules
############################################
echo "Initializing and updating git submodules..."
git submodule update --init --recursive
echo "Submodules initialized."

############################################
# 2. Set up submodule environments
############################################

# 2.1 Set up the backend environment
echo "Setting up the backend environment..."
cd backend || { echo "Backend folder not found! Exiting."; exit 1; }
# Optionally, set up a virtual environment here (e.g., python -m venv venv)
# source venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt
echo "Backend environment setup complete."
cd ..

# 2.2 Set up the frontend environment
echo "Setting up the frontend environment..."
cd frontend || { echo "Frontend folder not found! Exiting."; exit 1; }
npm install
echo "Frontend environment setup complete."
cd ..

############################################
# 3. Start the backend and frontend concurrently
############################################

# Start backend in a subshell in background
echo "Starting the backend server..."
(
  cd backend || exit 1
  # Run backend in background, logging to backend.log
  nohup python run.py > ../backend.log 2>&1
) &
BACKEND_PID=$!
echo "Backend server started with PID=${BACKEND_PID}"

# Start frontend in a subshell in background
echo "Starting the frontend development server..."
(
  cd frontend || exit 1
  # Run frontend in background, logging to frontend.log
  nohup npm start > ../frontend.log 2>&1
) &
FRONTEND_PID=$!
echo "Frontend server started with PID=${FRONTEND_PID}"

############################################
# Wait for both processes to finish
############################################
echo "Both servers have been started. Waiting for processes to finish..."
wait ${BACKEND_PID} ${FRONTEND_PID}

echo "All servers have exited. Exiting build script."
