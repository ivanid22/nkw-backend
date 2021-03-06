# nkw-backend
This is the backend server software for nkw, a web application that lets users create sales postings and favorite them.
In this repository you will find only the necessary components for the application backend, if you want to get the fronend up and running as well, please refer to [this repository](https://github.com/ivanid22/nkw-frontend)

# Installation

## Getting the files
First, you need to have the files on your computer. You can get them by either cloning this repository, or downloading its contents directly
- To clone the repository, go on the project's [Github page](https://github.com/ivanid22/nkw-backend), click on "Clone or download", copy the contents of the text box, and then run `git clone "repo"` on the command line, where "repo" is the text you just copied.
- If you want to download it directly instead, go on the project's [Github page](https://github.com/ivanid22/nkw-backend), click on "Clone or download", and then on "Download ZIP". After this, you need to extract the contents of the zip file on your computer.

Once you have the files on your computer, you need to make sure you meet the software requirements to run it (check the "Requirements" section below). Next, you need to navigate to the program's folder on your terminal.

## Installing dependencies

Next up, you need to install the program's dependencies through bundler, by running the command:

- `bundle install`

## Setting up the database

Once all dependencies are installed, migrate the database with the following commands:

- `rails db:migrate`
- `rails db:seed`

NOTE: Depending on the configuration and the permissions on your PostgreSQL installation, you might get an error message when the application cannot create the necessary databases. If that's the case, you need to manually create the following databases:

- nkw_backend_development
- nkw_backend_test
- nkw_backend_production

[Here's a link](https://www.postgresql.org/docs/9.0/sql-createdatabase.html) that could be of help with this process.

## Setting up storage

This application uses ActiveStorage for application assets.
By default, it uses AWS S3 storage services in production environments. If you plan on using S3, you need to set the following environment variables:

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_BUCKET_NAME

If you want to use the default disk service for production instead, update the following line in `/config/environments/production.rb`:

- `config.active_storage.service = :local`

## Running the server

Run the following command to start the server:

- `rails server`

## Running tests

Open a terminal on the base directory of the project and run the command `rspec`

# Requirements

- Ruby ~> 2.7
- Bundler ~> 2.1
- gem ~> 2.7
- PostgreSQL

## Built With

- Ruby
- Ruby on Rails
- PostgreSQL
 
## Author

👤 **Ivan Diaz**

- Github: [@ivanid22](https://github.com/ivanid22)
- Twitter: [@ivanid22](https://twitter.com/ivanid22)
- Linkedin: [Ivan Diaz](https://www.linkedin.com/in/ivanid22)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).