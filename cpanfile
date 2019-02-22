
# Core module at recent Perl5.
requires 'Log::Handler';
requires 'LWP::UserAgent';
##requires 'LWP::Protocol::https';
requires 'WWW::Mechanize';

on 'test' => sub {
##    requires 'Test::More', '0.98';
    requires 'Test::More';
};