# Use the official ERPNext Docker image as the base
FROM frappe/erpnext:v15.40.0

# Expose the port ERPNext runs on
EXPOSE 8000

# Set the entrypoint to run ERPNext
CMD ["bench", "start"]
