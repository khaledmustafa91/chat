#! /bin/bash
/wait
bundle exec rails db:exists && rails db:migrate || rails db:create db:migrate
# rails db:exists && rails db:migrate || rails db:setup

# rm /app/tmp/pids/server.pid

puma -C config/puma.rb
