# ERPNext Deployment on Railway

This guide outlines the steps to deploy ERPNext with a MariaDB database on Railway.

## Prerequisites
- A Railway account (sign up at https://railway.app).
- A GitHub account with a repository to store the configuration.
- Basic familiarity with Docker and Git.

## Steps to Deploy

1. **Create a GitHub Repository**
   - Create a new repository on GitHub (e.g., `erpnext-railway`).
   - Add the `Dockerfile` and `docker-compose.yml` files from above to the repository.

2. **Set Up Railway Project**
   - Log in to Railway (https://railway.app).
   - Click "Start a New Project" and select "Deploy from GitHub Repo."
   - Connect your GitHub account and select the `erpnext-railway` repository.
   - Railway will detect the `Dockerfile` and `docker-compose.yml` for deployment.

3. **Configure Environment Variables**
   - In the Railway dashboard, go to the "Variables" tab for the `erpnext` service.
   - Add the following variables:
     - `MARIADB_USER`: A username for MariaDB (e.g., `erpnext_user`).
     - `MARIADB_PASSWORD`: A secure password for the MariaDB user.
     - `MARIADB_ROOT_PASSWORD`: A secure password for the MariaDB root user.
     - `ADMIN_PASSWORD`: A secure password for the ERPNext admin user.
   - These variables will be used by the `docker-compose.yml` to configure the services.

4. **Deploy the Services**
   - Railway will automatically build and deploy the `erpnext` and `mariadb` services based on the `docker-compose.yml`.
   - Monitor the deployment logs in the Railway dashboard to ensure there are no errors.

5. **Access ERPNext**
   - Once deployed, Railway will provide a public URL for the `erpnext` service (e.g., `https://your-app.railway.app`).
   - Open the URL in your browser and log in with the `Administrator` user and the `ADMIN_PASSWORD` you set.
   - The initial setup wizard may appear; follow it to configure your ERPNext instance.

6. **Verify Database Connection**
   - Ensure the ERPNext service connects to the MariaDB service by checking the logs for any database-related errors.
   - The `DB_HOST=mariadb` in the `docker-compose.yml` ensures ERPNext connects to the MariaDB service internally.

## Notes
- **Railway Limitations**: Railway does not support multi-mount volumes, so this setup uses a simplified single-volume configuration for each service.[](https://station.railway.com/questions/how-to-deploy-erp-next-in-railway-2af65025)
- **Persistence**: The `erpnext-data` and `mariadb-data` volumes ensure data persistence between deployments.
- **Scaling**: For production, consider increasing resources (CPU, RAM) in Railway's settings to handle ERPNext's requirements (minimum 4GB RAM recommended).[](https://www.digitalocean.com/community/tutorials/how-to-install-an-erpnext-stack-on-ubuntu-20-04)
- **Security**: Use strong passwords for `MARIADB_ROOT_PASSWORD`, `MARIADB_PASSWORD`, and `ADMIN_PASSWORD`. Enable HTTPS by default on Railway for secure access.[](http://clefincode.com/blog/global-digital-vibes/en/implementing-end-to-end-logistics-in-erp-systems-the-erpnext-approach)
- **Backup**: Regularly back up the `mariadb-data` volume using Railway's volume export feature or `mysqldump` for the database.

## Troubleshooting
- If the deployment fails, check the build and deploy logs in the Railway dashboard for errors.[](https://docs.railway.com/quick-start)
- Ensure the environment variables are correctly set and match between the `erpnext` and `mariadb` services.
- If you encounter database connection issues, verify that the `mariadb` service is running and accessible within the Railway private network.[](https://docs.railway.com/guides/build-a-database-service)
- For further assistance, consult the Railway community or open a help thread.[](https://docs.railway.com/quick-start)

## Resources
- [ERPNext Official Documentation](https://docs.erpnext.com/)
- [Frappe Docker Repository](https://github.com/frappe/frappe_docker)
- [Railway Documentation](https://docs.railway.app/)