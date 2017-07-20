#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

use Module::CoreList;

=head1 What’s in Core?
=cut

say $Module::CoreList::version{5.01400}{CPAN};
say $Module::CoreList::version{5.02200}{CPAN};
say Module::CoreList->first_release('Module::Build');

=head2 Running corelist program
$ corelist Module::Build
Data for 2017-05-31
Module::Build was first released with perl v5.9.4, deprecated (will be CPAN-only) in v5.19.0 and removed from v5.21.0
=cut
