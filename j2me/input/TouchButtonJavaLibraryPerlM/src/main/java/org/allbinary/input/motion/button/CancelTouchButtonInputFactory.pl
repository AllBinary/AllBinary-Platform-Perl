#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::input::motion::button::CancelTouchButtonInputFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{cancelInputArray} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::motion::button::CancelTouchButtonInputFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::motion::button::CancelTouchButtonInputFactory::instance = 'org::allbinary::input::motion::button::CancelTouchButtonInputFactory'->new();
        }
        return $org::allbinary::input::motion::button::CancelTouchButtonInputFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $basicTouchInputFactory = 'org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance();
        for (my $index = scalar(@{$self->{cancelInputArray}}) - 1; $index >= 0; $index--) {
            $self->{cancelInputArray}->[$index] = $basicTouchInputFactory->{NONE};
        }
        $self->{cancelInputArray}->[$basicTouchInputFactory->{UP}->getSourceId()] = $basicTouchInputFactory->{DOWN};
        $self->{cancelInputArray}->[$basicTouchInputFactory->{DOWN}->getSourceId()] = $basicTouchInputFactory->{UP};
        $self->{cancelInputArray}->[$basicTouchInputFactory->{LEFT}->getSourceId()] = $basicTouchInputFactory->{RIGHT};
        $self->{cancelInputArray}->[$basicTouchInputFactory->{RIGHT}->getSourceId()] = $basicTouchInputFactory->{LEFT};
    return $self;
}


sub getCancel {
    my ($self, $touchButtonInput) = @_;
        return $self->{cancelInputArray}->[$touchButtonInput->getSourceId()];
}

use org::allbinary::game::input::InputFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::input::motion::button::BasicTouchInputFactory;

1;

