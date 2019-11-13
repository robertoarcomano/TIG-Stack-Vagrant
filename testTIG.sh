#!/usr/bin/env bats
N=10
DATABASE=temperature_db
IMPORT_PATH=/vagrant/import
@test "Insert Records and Check Number" {
  # 1. Create file with records
  /vagrant/create_data.sh $N $DATABASE > $IMPORT_PATH
  # 2. Insert records
  influx -import -path=$IMPORT_PATH
  # 3. Test records count
  N_ROWS=$(influx -database=$DATABASE -execute "select * from temperature"|tail -n +4|wc -l)
  [ "$N_ROWS" -eq $N ]
}

@test "Check Items Count After API call" {
  # 1. Call API to insert 1 new record
  curl -i -XPOST "http://localhost:8086/write?db=$DATABASE&precision=s" --data-binary 'temperature,mytag=1 myfield=90 1463683075'
  let M=$N+1
  N_ROWS=$(influx -database=$DATABASE -execute "select * from temperature"|tail -n +4|wc -l)
  [ "$N_ROWS" -eq $M ]
}
