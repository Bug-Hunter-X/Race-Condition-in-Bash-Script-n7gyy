#!/bin/bash

# This script demonstrates a race condition that can occur when multiple processes try to access and modify the same file simultaneously.

# Create a file named counter.txt with an initial value of 0
echo 0 > counter.txt

# Function to increment the counter
increment_counter() {
  # Read the current value from the file
  current_value=$(cat counter.txt)

  # Increment the value
  new_value=$((current_value + 1))

  # Write the new value back to the file
  echo $new_value > counter.txt
}

# Create two processes that increment the counter simultaneously
increment_counter &
increment_counter &

# Wait for both processes to finish
wait

# Print the final value of the counter
echo "Final counter value: $(cat counter.txt)"