# Generated Code Do Not Modify

package org::allbinary::game::input::analog::AnalogLocationInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_ANALOG_LOCATION_INPUT = 'org::allbinary::game::input::analog::AnalogLocationInput'->new(-1);

sub _init_fields {
    my ($self) = @_;
    $self->{playerId} = undef;
    $self->{customGPoint} = undef;
    $self->{rz} = 0;
    $self->{rightTrigger} = 0;
    $self->{leftTrigger} = 0;
}


sub new {
    my ($class, $playerId) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{playerId} = $playerId;
        $self->{customGPoint} = 'org::allbinary::graphics::CustomGPoint'->new(0, 0, 0);
    return $self;
}


sub getPlayerId {
    my ($self) = @_;
        return $self->{playerId};
}


sub getCustomGPoint {
    my ($self) = @_;
        return $self->{customGPoint};
}


sub getRz {
    my ($self) = @_;
        return $self->{rz};
}


sub setRz {
    my ($self, $rz) = @_;
        $self->{rz} = $rz;
}


sub getRightTrigger {
    my ($self) = @_;
        return $self->{rightTrigger};
}


sub setRightTrigger {
    my ($self, $rightTrigger) = @_;
        $self->{rightTrigger} = $rightTrigger;
}


sub getLeftTrigger {
    my ($self) = @_;
        return $self->{leftTrigger};
}


sub setLeftTrigger {
    my ($self, $leftTrigger) = @_;
        $self->{leftTrigger} = $leftTrigger;
}

use org::allbinary::graphics::CustomGPoint;

1;

