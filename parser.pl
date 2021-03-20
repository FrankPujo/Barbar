use strict;
use warnings;

my $content;
my $filename = $ARGV[0]; # <STDIN>
open( my $fh, '<', $filename );
{
	local $/;
	$content = <$fh>;
}

# delete tabs from content
$content =~ s/\t//g;

my @old_lines = split /\n/, $content;

my $old_lines_num = scalar @old_lines;

my $html_content;
my @barb_content;

for ( my $i = 1; $i < $old_lines_num; $i++ ) {

	my $old_line = $old_lines[$i];
	my @tokens = split / /, $old_line;
	my $relat = $tokens[0];
	my $tag = $tokens[1];
	my $id = $tokens[2];
	my $tokens_num = scalar @ tokens;

	# translate tags
	if ( $tag eq "1" ) {
		$tag = "h1";
	} elsif ( $tag eq "2" ) {
		$tag = "h2";
	} elsif ( $tag eq "3" ) {
		$tag = "h3";
	} elsif ( $tag eq "d" ) {
		$tag = "div";
	} elsif ( $tag eq "h" ) {
		$tag = "head";
	} elsif ( $tag eq "t" ) {
		$tag = "title";
	} elsif ( $tag eq "c" ) {
		$tag = "!--";
	} elsif ( $tag eq "q" ) {
		$tag = "hr";
	}

	my $barbar_line = "";

	for ( my $j = 3; $j < $tokens_num; $j++ ) {
		$barbar_line = $barbar_line . $tokens[$j] . " ";
	}
	
	my @line_arr = ( $relat, $tag, $id, $barbar_line );
	print( "@line_arr \n" );
	push( @line_arr, @barb_content );

	#    #    #    #    #    #    #    #    #    #    #    #    #
	# hold closing tags
	my $close_html = "</html>";
	my @hold = ( $close_html );
	# pop @hold
	# access AND remove last element
	#
	# $new_hold changes everytime
	# reassing AFTER pushing
	#
	# push( $new_hold, @hold )
	# add element to hold array
}

# TO DO create opening tags with IDs
# TO DO handle relations, indentation and closing tags