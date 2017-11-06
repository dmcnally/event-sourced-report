[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/ryantownsend/event-sourced-report)

### Setup

1. Deploy to Heroku
2. Attach Kafka
3. Add the Postgres addon
4. Create consumer groups `heroku kafka:consumer-groups:create report-order-consumer --app YOUR_APP_NAME`, `heroku kafka:consumer-groups:create report-cart-consumer --app YOUR_APP_NAME`
5. Boot consumers
