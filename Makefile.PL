
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Cairo backend for Graphics::Primitive",
  "AUTHOR" => "Cory G Watson <gphat\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Graphics::Color::RGB" => 0,
    "Graphics::Primitive::Font" => 0,
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Graphics-Primitive-Driver-Cairo",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Graphics::Primitive::Driver::Cairo",
  "PREREQ_PM" => {
    "Cairo" => 0,
    "Carp" => 0,
    "Geometry::Primitive::Point" => 0,
    "Geometry::Primitive::Rectangle" => 0,
    "Graphics::Primitive::Driver" => 0,
    "Graphics::Primitive::Driver::TextLayout" => 0,
    "Graphics::Primitive::TextBox" => 0,
    "IO::File" => 0,
    "Math::Trig" => 0,
    "Moose" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "Text::Flow" => 0
  },
  "VERSION" => "0.44",
  "test" => {
    "TESTS" => "t/*.t t/author/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



