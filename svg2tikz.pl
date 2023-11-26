use v5.22;
use warnings;
use strict;

=pod

=head1 NAME

  svg2tikz.pl - A helper script wrapping the python script svg2tikz, to clear the output for plain TeX consumption.

=head1 USAGE

  svg2tikz.pl file1.svg file2.svg...

=cut

my $last_file = '';
my $fh = undef;
while (<<>>) {
	if ($ARGV ne $last_file) {
		close $fh if defined $fh;
		my $outfile = $ARGV;
		$outfile = s/\.svg$/.tikz/;
		open $fh, '>', $outfile or 
			die "cannot open $outfile: $!";
	}
	s/\\begin\{([^}]+?)\}/\\$1/;
	s/\\end\{([^}]+?)\}/\\end$1/;
	print $fh $_;
}

