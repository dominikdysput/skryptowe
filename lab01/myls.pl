#!/usr/bin/perl

if ( not defined @ARGV[0])
{
	$dirpath = ".";
}
else
{
	$dirpath = @ARGV[0];
}

opendir($dh, $dirpath);

@arr = ();
while ( $filename = readdir($dh))
{
	push @arr, $filename;
}
closedir $dh;
@mySortedArray = sort @arr;
while ( $mySortedArray[$j] ) 
{
	$tmp = $mySortedArray[$j];
	if ($tmp ne ".." and $tmp ne ".")
	{
		print("$mySortedArray[$j] \n");
	}
	$j++;
}
