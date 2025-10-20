#!/usr/bin/perl

$server='https://<IP-address.hexstring>.plex.direct:<port>';
$client='<USERNAME>';

$sessions=`curl -o - -s "$server/status/sessions"`;
$sessions=~s/\n//g;
$sessions=~s/\r//g;
$sessions=~/^.*(Track.*?$client.*?Track).*$/;
$session=$1;
if ($session) {
   $session=~/^.*?title="(.*?)"/;
   $title=$1;
   $session=~/^.*? parentTitle="(.*?)"/;
   $parentTitle=$1;
   $session=~/^.*? originalTitle="(.*?)"/;
   $originalTitle=$1;
   $session=~/^.*? ratingKey="(.*?)"/;
   $ratingKey=$1;
   $res=`curl -s -X PUT "$server/:/rate?identifier=com.plexapp.plugins.library&key=$ratingKey&rating=10"`;
   $title=~s/&#8217;/'/g;
   $title=~s/&#39;/'/g;
   print "Rated ". $originalTitle ."'s track $title as five star";
} else {
   print "Sorry, $client, I didn't find anything playing.\n";
}
