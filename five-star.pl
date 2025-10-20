#!/usr/bin/perl

$server='https://<IP-address.hexstring>.plex.direct:<port>';
$client='<USERNAME>';
$rating_Num=10;
$rating_Word='five';

$sessions=`curl -o - -s "$server/status/sessions"`;
$sessions=~s/\n//g;
$sessions=~s/\r//g;
$sessions=~/^.*(Track.*?$client.*?Track).*$/;
$session=$1;
if ($session) {
   $session=~/^.*?title="(.*?)"/;
   $title=$1;
   $session=~/^.*? grandparentTitle="(.*?)"/;
   $grandparentTitle=$1;
   $session=~/^.*? originalTitle="(.*?)"/;
   $originalTitle=$1;
   $session=~/^.*? ratingKey="(.*?)"/;
   $ratingKey=$1;
   $res=`curl -s -X PUT "$server/:/rate?identifier=com.plexapp.plugins.library&key=$ratingKey&rating=$rating_Num"`;
   $title=~s/&#8217;/'/g;
   $title=~s/&#39;/'/g;
   print     "Rated ". $grandparentTitle ."'s track ". $title ." as ". $rating_Word. " star\n";
   print LOG "Rated ". $grandparentTitle ."'s track ". $title ." as ". $rating_Word. " star\n";
} else {
   print "Sorry, $client, I didn't find anything playing.\n";
}
