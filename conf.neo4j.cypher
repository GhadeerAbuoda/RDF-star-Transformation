
// init and 
CALL n10s.graphconfig.init();
CALL n10s.graphconfig.init({
 classLabel : 'Class',
 objectPropertyLabel: 'Rel',
 dataTypePropertyLabel: 'Prop',
subPropertyOfRel: 'SubPropOf',
subClassOfRel:, 'SubClassOf'
});


CREATE CONSTRAINT n10s_unique_uri ON (r:Resource) ASSERT r.uri IS UNIQUE;
call n10s.graphconfig.init( { handleMultival: "ARRAY" })

call n10s.graphconfig.set( { keepLangTag: true, handleRDFTypes: "LABELS" });
// import
CALL n10s.rdf.import.fetch("file://Case1.ttls","Turtle");

call n10s.graphconfig.set( { handleMultival: 'ARRAY' });

call n10s.graphconfig.set( { keepCustomDataTypes: true });
call n10s.graphconfig.set( { subClassOfRel: 'subClass'});

CALL n10s.graphconfig.set({ keepLangTag: true, handleMultival: 'ARRAY', multivalPropList : ['http://example.org/vocab/show/localName'] });
