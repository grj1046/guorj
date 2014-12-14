== README

###when deployment this app, please run this command when you start the server.

```
rm -rf public/assets/*

RAILS_ENV=production bundle exec rake assets:precompile
```

### for test, prepare the test data

```
buncle exec rake db:reset
bundle exec rake db:populate
```

### for production, init the data

```
bundle exec rake db:seed
```

###run unicorn

```
unicorn_rails -c config/unicorn.rb -E production -D
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
