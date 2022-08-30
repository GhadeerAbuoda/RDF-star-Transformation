# RDF-star-Transformation

This repository contains the scripts and the code for analyzing the transforming RDF and RDF-star into property graphs.

### Project & Libraries:
- [neosemantics](https://github.com/neo4j-labs/neosemantics): a well-known project to import RDF data into [Neo4J](https://neo4j.com/), implemented as a Neo4j plug-in. More details on usage can be found [here](https://neo4j.com/labs/neosemantics/).
- [RDF-star Tools](https://github.com/RDFstar/RDFstarTools) Project: A library provides a collection of command line tools and Java libraries to process RDF-star data and SPARQL-star queries. The project includes the conversion from RDF and RDF-star to property graphs. 
- [RDF2PG](https://github.com/renzoar/rdf2pg)

### Files: 
- Test_Cases.ttl: These cases are used to evaluate the transformation approaches developed to transform RDF and RDF-star graphs into  property graphs. At a general level, the test cases can be classified into test cases related to the RDF model and RDF-str model-specific features. 
- Queries.md: Example Cypher queries for the Neo4j graph after importing RDF and RDF-star cases in Test_Cases.ttl. 

