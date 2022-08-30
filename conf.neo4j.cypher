

CALL n10s.graphconfig.init();

CREATE CONSTRAINT n10s_unique_uri ON (r:Resource) ASSERT r.uri IS UNIQUE;
call n10s.graphconfig.init( { handleMultival: "ARRAY" })

LABELS_AND_NODESLABELS_AND_NODES
call n10s.graphconfig.set( { keepLangTag: true, handleRDFTypes: "LABELS" });

CALL n10s.rdf.import.fetch("file://Case1.ttls","Turtle");

