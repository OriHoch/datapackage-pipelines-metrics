# Datapackage Pipelines Metrics plugin

Allow to gather near real time metrics about running pipelines

Supported backends:

* [InfluxDB](https://www.influxdata.com/)

## Usage

TBD

## Development

For local development on this project:

* You should be inside an activated Python 3.6 virtualenv
* Start InfluxDB and Grafana servers:
  * `docker-compose up -d`
* Install the Python package
  * `pip install -e .`
* Run the test pipeline
  * `source .env.example`
  * `dpp run ./tests/noise`
* Log-in to grafana
  * http://localhost:13000
  * default username/password is admin/admin
* Add a datasource
  * Name: influxdb
  * Type: InfluxDB
  * Url: http://localhost:18086
  * Access: direct
  * Database: dpp
* Import the metrics dashboard
  * Dashboards > Import
  * Upload the dashboard file `grafana-dashboard.json`
* View the dashboard
  * If you ran the pipelines you should see some metrics
  * You can use the following snippet to keep running the pipeline and check the metrics in real-time
    * `while true; do dpp run ./tests/noise; done`
