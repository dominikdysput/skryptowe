#!/usr/bin/perl

$line;
$regexuserList = "WIPING[A-Za-z0-9]*/users";
$tmpExpresion;
@name = ();
@score = ();
@text = (); ## lista znakow/wyrazen 

$regexScore;
$regexName = "<a href=\"https://www.spoj.com/WIPING[A-Za-z0-9]*/users/[A-Za-z0-9_]*\">";

$i = 0;

##foreach my $line ( <STDIN> ) 
##{
##    print "$line\n";
##}

$filename = '4Potyczki.html';
  
if (open($fh, $filename))
{
	while ($row = <$fh>) 
	{
        ##if (index($row, $substr) != -1) 
        if($row =~ $regexuserList)
        {
            chomp $line;
            $line = $row;
        } 
        
    }
} 

$c;
for ( my $i = 0; $i < length($line); $i++ ) 
{ 
    $c = substr( $line, $i, 1);

    if($c eq "<" && $tmpExpresion ne "")
    {
        push @text, $tmpExpresion;
        $tmpExpresion = $c;
    }
    elsif($c eq "<")
    {
        $tmpExpresion = $c;
    }
    elsif($c eq ">")
    {
        $tmpExpresion = $tmpExpresion . $c;
        push @text, $tmpExpresion;
        $tmpExpresion = "";
    }
    elsif($c ne "<" && index($tmpExpresion, "<") != -1)
    {
        $tmpExpresion = $tmpExpresion . $c;
    }
    elsif($c ne "<" && $c ne ">" && index($tmpExpresion, "<") == -1)
    {
        $tmpExpresion = $tmpExpresion . $c;
    }
}
$wasFirst = 0;
$tmpNumber = 0;
$prev = "";
for ($i = 0; $i < scalar @text; $i++)
{
    if ($wasFirst == 1)
    {
        $j = $i + 1;
        while($j < scalar @text)
        {
            if ($text[$j] =~ "^[0-9,.]+\$")
            {
                $prev = $tmpNumber;
                $tmpNumber = $text[$j];
            }
            last if ($text[$j] =~ $regexName);
            $j++;
        }
    }
    if ($text[$i] =~ $regexName)
    {
        push @score, $prev;
        $wasFirst = 1;
        if (index($text[$i+1], "<") != -1 && index($text[$i+1], ">") != -1) ##jesli brak imienia to nazwa bedzie wyciagnieta z regexa
        {
            @tmp = split('/', $text[$i]);
            $emailInsteadEmpty = $tmp[scalar @tmp - 1];
            $emailInsteadEmpty = substr $emailInsteadEmpty, 0, -2;
            push @name, $emailInsteadEmpty;
        }
        else
        {
            push @name, $text[$i+1];
        }
        
    }
}
pop @score;
push @score, $tmpNumber;
@results;
$tmp = "";
print scalar @score. "\n";
print scalar @name;

if (scalar @score != scalar @name)
{
    print "something went wrong\n";
}
else
{
    for ($i = 0; $i < scalar @score;$i++)
    {
        $tmp = "\"". $name[$i] ."\"". ", " . $score[$i];
        push @results, $tmp; 
    }
}
for ($i = 0; $i < scalar @score;$i++)
{
    print $score[$i] . "\n";
}
