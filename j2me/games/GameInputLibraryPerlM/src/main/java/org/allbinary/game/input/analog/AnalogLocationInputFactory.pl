# Generated Code Do Not Modify

package org::allbinary::game::input::analog::AnalogLocationInputFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::analog::AnalogLocationInputFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::analog::AnalogLocationInputFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub addPlayer {
    my ($self, $playerInputId) = @_;
        my $analogLocationInput = $org::allbinary::game::input::analog::AnalogLocationInput::NULL_ANALOG_LOCATION_INPUT;
        if ($playerInputId < $self->{list}->size()) {
            $analogLocationInput = $self->{list}->get($playerInputId);
        }
        if ($analogLocationInput == $org::allbinary::game::input::analog::AnalogLocationInput::NULL_ANALOG_LOCATION_INPUT) {
            $analogLocationInput = 'org::allbinary::game::input::analog::AnalogLocationInput'->new($playerInputId);
            $self->{list}->add($analogLocationInput);
        }
}


sub getInstanceForPlayer {
    my ($self, $playerInputId) = @_;
        return $self->{list}->get($playerInputId);
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::input::analog::AnalogLocationInput;

1;

