## Deploying Project to Render:

Follow these Steps;

1. Push your code to GitHub. I'll assume that you have tested your endpoints and are able to work with them locally
2. Create a PostgreSQL Database on Render.
3. Assuming you had a local database with some data, you can add that data to the remote postgres DB on render by doing the following;
        - Navigate to your CMD/Terminal window (You should be running CMD as an admin)
        - Run the command cd / (to go the root path of the computer)
        - Run => cd "Pogram Files"
        - Run => cd PostgreSQL
        - Run => cd 15/bin
        - Export DB by running => pg_dump -U postgres -d agro-sales-db > agro-sales-export.sql
        - copy the file and paste it into your project file.

4. Connect to your Db via PSQL and paste the commands in the sql file
5. Go to render and create a WebService and setup with the right env variables
