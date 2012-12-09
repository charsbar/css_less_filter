use strict;
use warnings;
use FindBin;
use Test::More;
use CSS::LESS::Filter;

my @lessdirs = qw(
  extlib/less.js/test/less/
  extlib/bootstrap/less/
);

for my $dir (@lessdirs) {
  for my $file (glob "$FindBin::Bin/../$dir/*.less") {
    my ($basename) = $file =~ /([a-z0-9-]+\.less)$/;
    my $less = do { open my $fh, '<', $file; local $/; <$fh> };
    my $filter = CSS::LESS::Filter->new;
    is $less => $filter->process($less), "$basename is correct";
  }
}

done_testing;
