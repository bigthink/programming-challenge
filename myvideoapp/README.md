# My Video App

## Installation instructions

This application is just a Rails 5 application with a basic index and analytics. Here are the installation instructions:

```
rails db:seed
rails db:migrate
bundle install
rails s
```

The seed file may take a couple of minutes to run as it simulates usage data.

## Usage instructions

You should be automatically directed to http://localhost:3000 upon starting the application.

The application will start with a list of all the videos. Click on any of them in order to view analytics data about the video.

## Gem information
This application uses ChartKick as well as HighCharts. They're useful gems for writing simple graph implementations.
