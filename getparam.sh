#!/bin/sh
api='################################';
pwd='################################';

ca='prefix';
site='developershopname'
url="https://"$api:$pwd"@"$ca$site".myshopify.com/admin/";


dbname=$ca"shopify";
dbuser='####';
dbpassword='####';

collection=$1 
keydata=$2    
keyclose="}]"
rm $collection.json*


wget $url$collection.json

mongo -p $dbpassword -u $dbuser $dbname -eval "db.$collection.drop()"

sed -i s/{\"$keydata/\\n{\"$keydata/g $collection.json

sed -i /\"$collection/d $collection.json

sed s/.$// $collection.json

mongoimport -p $dbpassword -u $dbuser --db $dbname --collection $collection --file $collection.json

#mongoimport -h ds######.mongolab.com:41032 -d shopifysand -c $collection -u admin -p '######' --file $collection.json


#testing

echo $collection;

mongo -p $dbpassword -u $dbuser $dbname  -eval "db.getCollectionNames()"
mongo -p $dbpassword -u $dbuser $dbname  -eval "db."$collection".find().count()";

