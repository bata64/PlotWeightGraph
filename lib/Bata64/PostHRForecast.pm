package Bata64::PostHRForecast;
use utf8;
use Data::Dumper;

our $VERSION = "0.01";

sub new {
    my ($class,%opt) = @_;
    my $self = bless {
        base_url   => 'http://reimei.net:5127/api/',
        %opt,
    },$class;
    $self;
}

sub post {
    my ($self, $graphname, $datetime, $number) = @_;
    my $full_url = "$self->{base_url}${graphname}";
    my $ua = LWP::UserAgent->new;
    my $req = $ua->post($full_url, {
        number      => $number,
        datetime    => $datetime,
    });
    return $req->code;
}

1;
__END__

=encoding utf-8

=head1 NAME

Bata64::PostHRForecast - It's new $module

=head1 SYNOPSIS

    use Bata64::PostHRForecast;
    my $graph = Bata64::PostHRForecast->new(
        base_url   => 'http://bata64.com:5127/api/',
    );
    $graph->post($graphname, $datetime, $number);

=head1 DESCRIPTION

Bata::PostHRForecast is ...

=head1 LICENSE

Copyright (C) Keiji Kawabata.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

bata64 E<lt>bata64@gmail.comE<gt>

=cut

