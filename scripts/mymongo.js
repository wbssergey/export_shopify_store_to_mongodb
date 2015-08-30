db.auth('###','###');
db=db.getSiblingDB('#####');
var schemafy = function(schema, i, limit) {
    var i = (typeof i !== 'undefined') ? i : 1;
    var limit = (typeof limit !== 'undefined') ? limit : false;
    var type = '';
    var array = false;

    for (key in schema) {
        type = typeof schema[key];
        array = (schema[key] instanceof Array) ? true : false;

        if (type === 'object') {
            print(Array(i).join('    ') + key+' <'+((array) ? 'array' : type)+'>:');
            schemafy(schema[key], i+1, array);
        } else {
            print(Array(i).join('    ') + key+' <'+type+'>');
        }

        if (limit) {
            break;
        }
    }
}

var sproducts=schemafy(db.products.findOne());
var scustom_collections=schemafy(db.custom_collections.findOne());

