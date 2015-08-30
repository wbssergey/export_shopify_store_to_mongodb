#!/bin/sh

$db='####';
$u='###';
$p='####';

mongo -u $u -p $p $db web2.js
