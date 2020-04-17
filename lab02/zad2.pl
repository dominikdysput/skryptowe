#!/usr/bin/perl

@arrSTART = ();
@arrEND = ();
$sum = 0;
$regexSTART = "DTSTART[;][A-Za-z=/:]*[0-9]{8}T[0-9]{6}";
$regexEND   = "DTEND[;][A-Za-z=/:]*[0-9]{8}T[0-9]{6}";

foreach my $row ( <STDIN> ) 
{
	if ($row =~ $regexSTART)
	{
		$tmp = (substr($row, -17));
		$tmp =~ s/\s+//g; ## usuwanie bialych znakow i znakow nowej linii
		push @arrSTART, $tmp;
	}
	if ($row =~ $regexEND)
	{	
		$tmp = (substr($row, -17));
		$tmp =~ s/\s+//g; 
		push @arrEND, $tmp;
	}		
}

if( scalar @arrSTART != scalar @arrEND )
{
	print "NIE OK\n"; ## liczba godzin sie nie zgadza
}
else
{
	$i = 0;
	foreach(@arrSTART)
	{
		if ( substr($arrSTART[$i], 0, 8) != substr($arrEND[$i], 0, 8)) ## zajecia powinny odbywac sie jednego dnia
		{
			print "NIE OK";	
		}
		else
		{
			$tmpEND = substr($arrEND[$i], 9, 4);
			$tmpHoursEND = substr($tmpEND, 0, 2);
			$tmpMinutesEND = substr($tmpEND, 2, 2);
			$tmpTimeEND = $tmpHoursEND * 60 + $tmpMinutesEND;

			$tmpSTART = substr($arrSTART[$i], 9, 4);
			$tmpHoursSTART = substr($tmpSTART, 0, 2);
			$tmpMinutesSTART = substr($tmpSTART, 2, 2);
			$tmpTimeSTART = $tmpHoursSTART * 60 + $tmpMinutesSTART;

			$timeOneLession = ($tmpTimeEND - $tmpTimeSTART) / 45;

			$sum = $sum + int($timeOneLession);
		}
		$i++;
	}
}
print $sum;
print "\n";