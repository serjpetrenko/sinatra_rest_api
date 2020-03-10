Sinatra Rest API
=============

#### Technologies Used
+ Sinatra - 2.0.7
+ Sequel
+ PostgresQL
+ Puma

#### How to install the project

* Use ruby version `2.6.3`

* In the root directory run command `bundle install`

* Copy `.env.sample` into `.env`

* Create manually database with name `sinatra_rest_api`

* Run migrations with command `rake db:migrate`


#### How to run application
Inside root folder enter this commands in terminal:
```sh
rake shot
```

#### How to use developer console

Inside root folder run next command:

```sh
rake c
```

Or

```sh
rake console
```

Console give access to the models, and allow to make all CRUD operations with database.
