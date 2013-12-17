
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "SHARYANTO's temporary namespace for various roles",
  "AUTHOR" => "Steven Haryanto <stevenharyanto\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "SHARYANTO-Roles",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "SHARYANTO::Roles",
  "PREREQ_PM" => {
    "Color::ANSI::Util" => "0.03",
    "Log::Any" => 0,
    "Module::List" => 0,
    "Moo::Role" => 0,
    "Term::Detect::Software" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Moo" => 0,
    "Test::More" => "0.98"
  },
  "VERSION" => "0.68",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Color::ANSI::Util" => "0.03",
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Log::Any" => 0,
  "Module::List" => 0,
  "Moo" => 0,
  "Moo::Role" => 0,
  "Term::Detect::Software" => 0,
  "Test::More" => "0.98"
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



