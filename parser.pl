use strict;
use warnings;

my $p = chr( 156 );
print( "$p\n" );

my $content;
my $filename = "test.barb"; # <STDIN>
open( my $fh, '<', $filename );
{
    local $/;
    $content = <$fh>;
}

 my @lines = split /\n/, $content;

my $lines_num = scalar @lines;
for ( my $i = 0,; $i < $lines_num; $i++ ) {
	print( "$lines[$i]\n" );
}