FROM frappe/erpnext:v14.35.2

# Switch to frappe user
USER frappe

# Set work directory
WORKDIR /home/frappe/frappe-bench

# Copy custom configurations if any
COPY --chown=frappe:frappe . /home/frappe/frappe-bench/

# Expose port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=120s --retries=3 \
  CMD curl -f http://localhost:8000 || exit 1

# Start command
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
