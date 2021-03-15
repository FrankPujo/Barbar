use strict;
use warnings;

my $content;
my $filename = "test.barb"; # <STDIN>
open( my $fh, '<', $filename );
{
	local $/;
	$content = <$fh>;
}

my @old_lines = split /\n/, $content;

my $old_lines_num = scalar @old_lines;

my $html_content;
my %barbar_hash;
my @barb_content;

for ( my $i = 1; $i < $old_lines_num; $i++ ) {

	my $old_line = $old_lines[$i];
	my @tokens = split / /, $old_line;
	my $relat = $tokens[0];
	my $tag = $tokens[1];
	my $id = $tokens[2];
	my $tokens_num = scalar @ tokens;

	my $barbar_line = "";

	for ( my $j = 3; $j < $tokens_num; $j++ ) {
		$barbar_line = $barbar_line . $tokens[$j] . " ";
	}
	
	#my %line_hash = { 'relat', $relat, 'tag', $tag, 'id', $id, 'content', $barbar_line };

	my @line_arr = ( $relat, $id, $tag, $id, $barbar_line );
	push( @line_arr, @barb_content );
	#print( "$relat\n" );
	#print( "$tag\n" );
	#print( "$id\n" );
	#print( "$barbar_line\n" );
	#convert_to_html();
}

sub convert_to_html {
	print( "\nline!\n" );
}