# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

- MySQL v8.0.17
- Redis 5.0.5

* Configuration

The only thing we need to edit is the `database.yml`  with the right credentials for our database instance.

* Database creation

```
rake db:create
```

* Database initialization

```
rake db:migrate && rake db:seed
```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## API call examples

### Create a thermostat

Request

```
curl -X POST \
  http://0.0.0.0:3000/thermostats \
  -H 'Content-Type: application/json' \
  -d '{ "location": "1 Infinite Loop, Cupertino, CA 95014, EE. UU." }'
```

Response

```
{
    "id": 1,
    "household_token": "3Zq62UHxB5MGuCv8nc99Ugtt",
    "location": "1 Infinite Loop, Cupertino, CA 95014, EE. UU.",
    "readings": []
}
```

With the returned `household_token` we can make new requests to `/readings` or `/stats/:thermostat_id`

### Get readings

Request

```
curl -X GET \
  http://0.0.0.0:3000/readings \
  -H 'Authorization: Token token=3Zq62UHxB5MGuCv8nc99Ugtt' \
  -H 'cache-control: no-cache'
 ```
 
 Response
 
 ```
 [
    {
        "id": 1,
        "tracking_number": 1,
        "temperature": 23,
        "humidity": 55,
        "battery_charge": 35,
        "thermostat": {
            "id": 75,
            "household_token": "cVtt6MC0bP9ZKkcFBIvxbgtt",
            "location": "Apt. 784 7737 Fisher Mews, Port Ora, OR 52423-4596"
        }
    },
    ...
```
 
### Get stats

Request

```
curl -X GET \
  http://0.0.0.0:3000/stats/1 \
  -H 'Authorization: Token token=3Zq62UHxB5MGuCv8nc99Ugtt' \
  -H 'cache-control: no-cache'
 ```
 
 Response
 
 ```
 {
    "thermostat_id": 1,
    "household_token": "R5UPDFMXs82PKcZSR8qiswtt",
    "location": "6030 Parker Square, Lake Seema, WA 21820",
    "temperature": {
        "min": -7,
        "max": 43,
        "avg": "0.16"
    },
    "humidity": {
        "min": 0,
        "max": 95,
        "avg": "0.53"
    },
    "battery_charge": {
        "min": 0,
        "max": 90,
        "avg": "0.6"
    }
}
 ```
