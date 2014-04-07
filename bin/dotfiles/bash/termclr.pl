#!/usr/bin/perl

use Getopt::Long;
use strict;
use warnings;

my $foreground   = 0;
my $transparency = 1;
my $alpha        = 80;
my $help         = 0;
my $result = Getopt::Long::GetOptions(
    'fg|foreground' => \$foreground,
    'transparency!' => \$transparency,
    'alpha:i'       => \$alpha,
    'help|?'        => \$help,
);

die "Usage: $0 [--alpha <number>] [--foreground] [--[no]transparency] [--[no]dark]\n"
    if @ARGV or not $result or $help;
die "Option 'alpha' must be between 0 (transparent) and 100 (opaque)\n"
    if $alpha < 0 or $alpha > 100;

$alpha = 100 unless $transparency;
$alpha = ( $alpha * 65535 ) / 100;

my ($bg, $bg1, $fg) = random_colors( );
($fg, $bg) = ($bg, $fg) if $foreground;

$" = ", ";
open(OSA,"|-", "osascript");
print OSA <<SCRIPT;
tell front window of app "Terminal"
    set background color to {@$bg, $alpha}
    set normal text color to {@$fg}
    set bold text color to {@$bg1}
    set cursor color to {@$bg1}
end tell
SCRIPT

close(OSA);
exit 0;

sub random_colors {
    my @rgb = map { int rand 256 } 1 .. 3;
    my $lum = ($rgb[0] * 0.3) + ($rgb[1] * 0.59) + ($rgb[2] * 0.11);
    my @rgb_bold = map { ( ( $_ + 128 ) % 256 ) * 257 } @rgb;
    @rgb = map { $_ * 257 } @rgb;
    my @rgb_fg = $lum < 128 ? (65535, 65535, 65535) : (0, 0, 0);
    return (\@rgb, \@rgb_bold, \@rgb_fg);
}
