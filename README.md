# SoBi Server

First you should download this repo and run `bundle`.

Then run `rake db:setup` to create your database.

Next you should install redis

on linux:
```
  $ wget http://download.redis.io/releases/redis-2.8.18.tar.gz
  $ tar xzf redis-2.8.18.tar.gz
  $ cd redis-2.8.18
  $ make
```

or if you are on mac just:
```
  $ brew install redis
```

To run dev server run `bundle exec foreman start` it will launch sidekiq and web server. 
