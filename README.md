## Ruby Version
> 2.7.4

## Database Adaptor
> sqlite3

## Docker
```
docker run --name redis --publish-all=true -d -p:6379:6379 redis;
```

## Configuration Files
#### **config/application.yml**
```
default: &default
  ACTION_MAILER_PERFORM_DELIVERIES: 'true'

development:
  <<: *default
  ACTION_MAILER_DELIVERY_METHOD: letter_opener
  LAUNCHY_DRY_RUN: 'true'
  BROWSER: '/dev/null'

test:
  <<: *default
  ACTION_MAILER_DELIVERY_METHOD: letter_opener

production:
  <<: *default
```

#### **config/database.yml**
```
default: &default
  adapter:  sqlite3
  encoding: unicode
  pool:     <%= ENV.fetch('RAILS_MAX_THREADS') { 5 } %>
  timeout:  5000
  # ↓↓↓↓↓↓ Not needed for sqlite3 ↓↓↓↓↓↓
  host:     localhost
  username: fonix
  password:

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as 'test' will be erased and
# re-generated from your development database when you run 'rake'.
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3
  # ↓↓↓↓↓↓ Not needed for sqlite3 ↓↓↓↓↓↓
  host:     localhost
  username: fonix
  password:
```

## Initializing Rails App
```
bundle install
rails db:migrate
```

## Start Rails App
```
rails server -b 0.0.0.0
```
Open web browser, and navigate to http://localhost:3000.

## Send Weekly Summary email
```
bundle exec rake scheduled:weekly_statistics
```
Emails can be found in `/tmp/letter_opener`.
