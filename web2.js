
db.web2.drop();


db.collects.aggregate( {$group: {          '_id':'$collection_id', count: {$sum:1}}  } , {$project:  { _id:0, count:1,   collection_id: "$_id" } }  , {$out: 'web2'} );
