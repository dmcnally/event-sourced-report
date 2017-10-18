web: bundle exec puma -C config/puma.rb
orderconsumer: bundle exec racecar --require config/racecar OrderConsumer
cartconsumer: bundle exec racecar --require config/racecar CartConsumer
release: bundle exec rake db:migrate
