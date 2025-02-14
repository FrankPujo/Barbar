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

my @lines = split /\n/, $content;

my $lines_num = scalar @lines;


my $html_content = "<html>\n";
my @barb_content;
my $close_html = "</html>";
my @hold = ( $close_html );


for ( my $i = 1; $i < $lines_num; $i++ ) {

	my $line = $lines[$i];
	my @tokens = split / /, $line;
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
	} elsif ( $tag eq "b" ) {
		$tag = "body";
	}

	if ( $id eq "*" ) {
		$id = "";
	}

	my $barbar_text_line = "";

	for ( my $j = 3; $j < $tokens_num; $j++ ) {
		$barbar_text_line = $barbar_text_line . $tokens[$j] . " ";
	}
	
	my @line_arr = ( $relat, $tag, $id, $barbar_text_line );
	#print( "@line_arr \n" );
	push( @line_arr, @barb_content );

	$html_content = $html_content . "<" . $tag . " id=\"" . $id . "\">" . $barbar_text_line;

	############

	my $new_hold = $tag;
	push( @hold, $new_hold );

	if ( $relat eq "^" ) {
		my $tempClosing = pop( @hold );
		pop @hold;
		$html_content = $html_content . "</" . $tempClosing . ">\n";
		#my $tempClosing = pop( @hold );
		#pop @hold;
		#$html_content = $html_content . "</" . $tempClosing . ">\n";
	} elsif ( $relat eq "&" ) {
		$html_content = $html_content . "</" . $tag . ">\n";
	} elsif ( $relat eq ">" ) {
		$html_content = $html_content . "\n";
	}

}

print( $html_content );

# writing to file
my $target_file = ">" . substr( $filename, 0, -5 ) . ".html";
open( FH, $target_file );
print FH $html_content;
close FH;