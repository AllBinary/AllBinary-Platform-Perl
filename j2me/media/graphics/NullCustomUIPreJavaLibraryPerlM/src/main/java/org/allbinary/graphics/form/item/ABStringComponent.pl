# Generated Code Do Not Modify

package org::allbinary::graphics::form::item::ABStringComponent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_STRING_COMPONENT, 'java::lang::LazyStatic', sub { 'org::allbinary::graphics::form::item::ABStringComponent'->new('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}) };


sub getBackgroundBasicColor {
    my ($self) = @_;
        return 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
}


sub new {
    my ($class, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getForegroundBasicColor {
    my ($self) = @_;
        return 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
}


sub setForegroundBasicColor {
    my ($self, $foregroundBasicColor) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::graphics::color::BasicColor ();
use org::allbinary::graphics::color::BasicColorFactory ();

1;

