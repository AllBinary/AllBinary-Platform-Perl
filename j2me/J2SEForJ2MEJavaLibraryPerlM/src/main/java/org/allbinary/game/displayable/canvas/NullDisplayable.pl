# Generated Code Do Not Modify

#J2SEForJ2ME
package org::allbinary::game::displayable::canvas::NullDisplayable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::Canvas';

our $SINGLETON = 'org::allbinary::game::displayable::canvas::NullDisplayable'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{baseGameStatistics} = 'org::allbinary::canvas::GameStatisticsFactory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::NullDisplayable::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{baseGameStatistics}->nextRefresh();
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::canvas::BaseGameStatistics;
use org::allbinary::canvas::GameStatisticsFactory;

1;

