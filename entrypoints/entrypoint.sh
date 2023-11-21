#!/bin/bash

rm -f tmp/pids/server.pid
bundle

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
bundle exec rake db:seed

rails s -b '0.0.0.0'
