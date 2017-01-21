# SoBi Server (pub/sub with Redis)

SoBi Server gets and displays informations delivered from small commandline applications - [SoBi Clients](https://github.com/jpietrzyk/sobi-cli).

## Instalation

First you should download this repo and run `bundle`. Then run `rake db:setup` to create your database. Next you should install Redis

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
Set your redis configuration in `.env` file.
Run specs to check everything is ok `bundle exec rspec spec/`

## Usage

To run dev server run `bundle exec foreman start` it will launch subscriber and web server. Messages will be displayed here: http://localhost:3000

To see how to setup client check: https://github.com/jpietrzyk/sobi-cli

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpietrzyk/sobi_srv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
