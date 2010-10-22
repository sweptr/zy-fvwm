#!/usr/bin/perl
# $Id$

my $cmd = "";
$cmd = "tar xfv"  if $ARGV[0] =~ /\.tar$/;
$cmd = "tar xfvz" if $ARGV[0] =~ /\.(tgz|tar\.gz|tar\.Z)$/;
$cmd = "tar xfvj" if $ARGV[0] =~ /\.tar\.bz2$/;
$cmd = "unace x" if $ARGV[0] =~ /\.ace$/;
$cmd = "ar xv" if $ARGV[0] =~ /\.(ar|deb)$/;
$cmd = "unarj x" if $ARGV[0] =~ /\.arj$/;
$cmd = "unrar x" if $ARGV[0] =~ /\.rar$/;
$cmd = "xar -xvf" if $ARGV[0] =~ /\.xar$/;
$cmd = "unzip" if $ARGV[0] =~ /\.zip$/;

if ($cmd eq "") {
	print STDERR "$0 error: suffix not recognized: $ARGV[0]\n";
	exit(1);
}

my $args = join " ", map { "\"$_\""; } @ARGV;
open T, "$cmd $args |" or die "$cmd: $!";
$_ = <T> || 0 or exit 1;
($prefix) = m|(.+)/|;
print STDERR;

while(<T>) {
	print STDERR;
	"$prefix/###$_" =~ m|^(.*)/.*?###\1|;
	$prefix = $1;
}

if($prefix eq "") { exit 1 } else { print "$prefix\n"; exit 0 }
