#!/usr/bin/perl
use warnings;
use strict;
use JSON;
use LWP::Simple;

my $json = get( 'http://worldcup.sfg.io/matches' ) or die "Could not access results!\n";
my $decoded = decode_json($json);

for my $match ( @{$decoded} ) {
    if ( $match->{status} eq "completed" ) {
        printf( "%12s %d:%d %s\n", 
                $match->{home_team}{country},
                $match->{home_team}{goals},
                $match->{away_team}{goals},
                $match->{away_team}{country}
        );
    }
}