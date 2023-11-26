use v5.10;
use strict;
use warnings;

use File::Copy::Recursive qw/dircopy/;
use Shell::Command qw/touch/;

my $curdir = $ARGV[0];
my $objdir = $ARGV[1];

chdir $curdir;

if ($curdir ne $objdir) {
	if ($^O =~ /Win/) {
		say "Falling back to copying on Windows";
		dircopy "$curdir/fonts", "$objdir/fonts"
	}
	else {
		system qq,ln -s "$curdir/fonts" "$objdir/fonts", unless -l "$objdir/fonts"
	}
}
touch "$objdir/fonts/.build"

