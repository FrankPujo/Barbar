use strict;
use warnings;

my $p = chr( 156 );

my $content;
my $filename = "test.barb"; # <STDIN>
open( my $fh, '<', $filename );
{
    local $/;
    $content = <$fh>;
}

 my @lines = split /\n/, $content;

my $lines_num = scalar @lines;

my $html_content;

for ( my $i = 0; $i < $lines_num; $i++ ) {
	my $line = $lines[$i];
	my @tokens = split / /, $line;
	my $type = substr $tokens[0], 2;
	print( "<$type>" );
	my $tokens_num = scalar @ tokens;
	#print( $tokens_num )
	for ( my $j = 1; $j < $tokens_num; $j++ ) {
		print( "$tokens[$j] " );
	}
	print( "</$type>\n" );
}