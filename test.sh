curl -X POST \
  http://0.0.0.0:3000/readings \
  -H 'Authorization: Token token=rlGa4KQHz9pPGMklymrazgtt' \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 2b3fe7f1-0e72-4633-9445-c459acd030fb' \
  -H 'cache-control: no-cache' \
  -d '{ "reading": { "temperature": 0, "humidity": 0, "battery_charge": 0, "thermostat_id": 1 } }'