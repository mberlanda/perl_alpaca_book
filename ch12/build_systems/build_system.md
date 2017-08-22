# Perl’s Two Build Systems

build system:

- `ExtUtils::Makemaker`: based on *make* (Makefile.PL)
- `Module::Build`: pure Perl-tool (Build.PL)

first distrubution:


sudo apt install libmodule-starter-perl

- `$ h2xs -AX -n Animal`
- `$ module-starter --module=Animal --author="Gilligan" --email=gilligan@island.example.com --verbose`
- `$ module-starter --mb --module="Animal" --email=kupta@cpan.org` using Module::Builder
- Custom Templates

documentation:

- `$ perldoc lib/Animal.pm`
- `$ pod2html lib/Animal.pm`

check POD syntax

