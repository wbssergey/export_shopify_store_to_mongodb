#!/usr/bin/perl

use strict;
use warnings;
binmode(STDOUT, ":utf8");          #treat as if it is UTF-8
binmode(STDIN, ":encoding(utf8)"); #actually check if it is UTF-8`


use lib '/opt/shopifyperl/WWW-Shopify-0.99999/lib';
# Adam Harrison WWW:Shopify
# http://search.cpan.org/~adamdh/WWW-Shopify-0.99999/

use File::Basename;
use WWW::Shopify::Public;
use WWW::Shopify::Common::DBIx;
use Module::Find;
use Data::Dumper;
use WWW::Shopify::Field::String;
use Cwd 'abs_path';

my $myobject = shift(@ARGV);
  print "Object: $myobject\n";

#my $myobject='Product';
#my $myobject='Order';

my $ShopURL = 'developershop.myshopify.com';
my  $APIKey =  '#######################';
my  $AccessToken = '#######################';


my $SA = new WWW::Shopify::Public($ShopURL, $APIKey, $AccessToken);
my $DBIX = new WWW::Shopify::Common::DBIx();
my @products = $SA->get_all($myobject);
for (@products) {
        print "\n";
while (my ($k,$v)=each %$_){
if(!defined ($v)) { 
print($k."\n");
}
else
{
print "$k $v\n"};
};
}
