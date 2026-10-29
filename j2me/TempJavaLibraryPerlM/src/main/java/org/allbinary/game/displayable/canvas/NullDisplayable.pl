# Generated Code Do Not Modify

#Temp should not be in any build
package org::allbinary::game::displayable::canvas::NullDisplayable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::Canvas';

our $SINGLETON = 'org::allbinary::game::displayable::canvas::NullDisplayable'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::NullDisplayable::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;

1;

