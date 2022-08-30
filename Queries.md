# Example Cypher Queries to check property graphs in Neo4j

###### Case 2: Return RDF resource (ex:mentor) if it is an edge (i.e., relation)
```
  MATCH p=()-[r:mentor]->() RETURN p
```
###### Case 2: Return RDF resource (ex:mentor) if it is a node with url property 
```
MATCH (n) where n.uri="http://example.com/mentor" return n
```
######  Case 2: Return both representations of the RDF resource (ex:mentor)
```
MATCH (n) where n.uri="http://example.com/mentor"  return 
DISTINCT "node" AS entity, n.uri  AS uri 
UNION ALL
MATCH p=()-[r:mentor]->() 
RETURN DISTINCT "relationship" 
AS entity, type(r) as uri 
```
######  Case 2: Return property (name) for the RDF resource (ex:mentor)
```
MATCH (n) WHERE EXISTS(n.name) RETURN DISTINCT "node" 
AS entity, n.name AS name 

UNION ALL

MATCH ()-[r]-() WHERE EXISTS(r.name) RETURN DISTINCT "relationship" 
AS entity, r.name AS name 
```
###### Case 8: Return property key (certainty) that represents the outer predicate of RDF-star triple
```
MATCH (n) WHERE EXISTS(n.certainty) RETURN DISTINCT "node" as entity, 
n.certainty AS certainty 
UNION ALL 
MATCH ()-[r]-() WHERE EXISTS(r.certainty) RETURN DISTINCT "relationship" 
AS entity, r.certainty AS certainty 
```
###### Case 8: Return the relation (ex:likes) of the embedded RDF-star
```
MATCH p=()-[r:likes]->() RETURN p 
```
###### Case 8: Return RDF resources of the RDF-star triple
```
MATCH (n) where n.uri="http://example.com/Mary" return n
MATCH (n) where n.uri="http://example.com/Matt" return n
```
###### Case 11: Return nodes with uri = http://example.com/Alex
```
MATCH (n) where n.uri="http://example.com/Alex" return n
```
###### Case 14: Return all property keys of (likes) relation 
 ```
 MATCH p=()-[r:likes]->() RETURN keys(r)
 ```
###### Case 14: Return all property (certainty) of (likes) relation  

 ```
 MATCH (n1:Resource)-[r:likes]-(n2:Resource) return r.certainty 
```




