
# Core module at recent Perl5.
requires 'Log::Handler';
requires 'LWP::UserAgent';

on 'test' => sub {
    requires 'Test::More';
};