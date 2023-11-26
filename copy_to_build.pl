use v5.10;
use strict;
use warnings;

use File::Copy qw/copy/;

my $curdir = shift @ARGV;
my $objdir = shift @ARGV;

chdir $curdir;

exit 0 if $curdir eq $objdir;

for my $file (@ARGV) {
	my $src = "$curdir/$file";
	my $dst = "$objdir/$file";
	if (-f $src) {
		copy $src, $dst if ((-M $src) // 9999999999999) > ((-M $dst) // 0)
	}
}
