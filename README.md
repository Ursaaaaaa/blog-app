![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails Blog

This project is full functional blog application, that includes users, posts, comments, and likes. The project code is following the SOLID principles and other best practices.

## Built With

- Ruby
- Rails 7.0

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

  - Install ruby  - [Installation guides](https://www.ruby-lang.org/en/documentation/installation/)
  - install PostgreSQL - [Installation guides](https://www.postgresql.org/download/linux/)
  - install libpqdev ``` sudo apt install libpq-dev  ``` for linux debian users
  - Make sure your Postgresql is running. If not, start the service by typing ```sudo service postgresql start``` in your terminal (for linux debian users)

### Setup

 ```git clone``` this [repo](https://github.com/ramrod433/blog-app)
  - Run:
    - ```cd blog-app```
    - ```bundle install```
  
* Database creation
  - Run
       - ```rake db:create```

* Tests
  - Run (*ensure your postgreSQL is running as well*)
      - Integrations
        - **Method 1:** ```bundle exec rspec test/integration/ ```
        > if fails, try
        - **Method 2:**  ```rspec test/integration/```

* Run project
  - ```rails db:migrate:reset db:seed``` then
  - Run ```rails s``` and visit [http://localhost:3000/](http://localhost:3000/) in your browser!

### Usage

Kindly modify the files as needed.

## Author

👤 **Nii Amanor Djoleto**

- GitHub: [@ramrod433](https://github.com/ramrod433)
- Twitter: [@\_Djoleto](https://twitter.com/_djoleto_)
- LinkedIn: [Nii Amanor Djoleto](https://linkedin.com/in/nii-amanor-djoleto)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ramrod433/blog-app/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
