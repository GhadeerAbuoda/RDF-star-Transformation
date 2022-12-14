export NEO4J_HOME=${NEO4J_HOME-~/Documents/Graphs/neo4j-community-4.3.6}
if [ ! -f data-csv.zip ]; then
  curl -OL https://cloudfront-files-1.publicintegrity.org/offshoreleaks/data-csv.zip
fi
	
export DATA=${PWD}/import

rm -rf $DATA

unzip -o -j data-csv.zip -d $DATA

wc -l $DATA/*.csv

tr -d '\\' < $DATA/Addresses.csv > $DATA/Addresses_fixed.csv

for i in $DATA/[AIEO]*.csv; do echo $i; sed -i '' -e '1,1 s/node_id/node_id:ID/' $i; done

sed -i '' -e '1 d' $DATA/all_edges.csv
tr '[:lower:]' '[:upper:]' < $DATA/all_edges.csv | sed  -e 's/[^A-Z0-9,_ ]//g' -e 's/  */_/g' -e 's/,_/_/g' > $DATA/all_edges_cleaned.csv

echo 'node_id:START_ID,rel_type:TYPE,node_id:END_ID' > $DATA/all_edges_header.csv

rm -rf $DATA/panama.db

head -1 $DATA/*.csv

rm -rf $DATA/panamadb.db; $NEO4J_HOME/bin/neo4j-admin import --database=panamadb --nodes=Address=$DATA/Addresses_fixed.csv --nodes=Entity=$DATA/Entities.csv --nodes=Intermediary=$DATA/Intermediaries.csv --nodes=Officer=$DATA/Officers.csv \
  --relationships $DATA/all_edges_header.csv,$DATA/all_edges_cleaned.csv --ignore-extra-columns true --ignore-empty-strings true --skip-duplicate-nodes true --skip-bad-relationships true --bad-tolerance  1000000 --multiline-fields=true

$NEO4J_HOME/bin/cypher-shell --database=panamadb  "MATCH (n) RETURN count(*) as nodes;"
$NEO4J_HOME/bin/cypher-shell --database=panamadb  'MATCH ()-->() RETURN count(*) as relationships;'
$NEO4J_HOME/bin/cypher-shell --database=panamadb  'MATCH (n) RETURN labels(n),count(*) ORDER BY count(*) DESC;'
$NEO4J_HOME/bin/cypher-shell --database=panamadb  'MATCH (n)-[r]->(m) RETURN labels(n),type(r),labels(m),count(*) ORDER BY count(*) DESC;'
$NEO4J_HOME/bin/cypher-shell --database=panamadb  'MATCH (n)-[r]->(m) RETURN collect(distinct labels(n)),type(r),collect(distinct labels(m)),count(*) ORDER BY count(*) DESC;'
$NEO4J_HOME/bin/cypher-shell --database=panamadb  'MATCH (n)-[r]->(m) RETURN collect(distinct labels(n)),type(r),labels(m),count(*) ORDER BY count(*) DESC;'
$NEO4J_HOME/bin/cypher-shell --database=panamadb  'MATCH (n)-[r]->(m) RETURN labels(n),type(r),collect(distinct labels(m)),count(*) ORDER BY count(*) DESC;'
$NEO4J_HOME/bin/cypher-shell --database=panamadb  'MATCH ()-[r]->() RETURN type(r),r.detail,count(*) ORDER BY count(*) DESC;'
