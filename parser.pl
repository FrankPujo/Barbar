use strict;
use warnings;

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
my %barbar_hash;

for ( my $i = 1; $i < $lines_num; $i++ ) {

	my $line = $lines[$i];
	my @tokens = split / /, $line;
	my $relat = $tokens[0];
	my $tag = $tokens[1];
	my $id = $tokens[2];
	my $tokens_num = scalar @ tokens;

	my $barbar_line = "";

	for ( my $j = 3; $j < $tokens_num; $j++ ) {
		$barbar_line = $barbar_line . $tokens[$j] . " ";
	}
	
	#my %line_hash = { 'relat', $relat, 'tag', $tag, 'id', $id, 'content', $barbar_line };

	#print( $line_hash{'relat'} );

	print( "$relat\n" );
	print( "$tag\n" );
	print( "$id\n" );
	print( $barbar_line );
}

sub convert_to_html {
	 conversion
}