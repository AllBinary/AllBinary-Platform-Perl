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

package org::allbinary::game::input::InputFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{KEY_CODE_LABEL} = "KeyCode: ";
    $self->{DEVICE_ID_LABEL} = "DeviceId: ";
    $self->{MAX} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getMin();
    $self->{inputIntegerArray} = [(undef) x ($self->{MAX})];
    $self->{NO_INPUT} = 'org::allbinary::game::input::Input'->new(0, $self->{commonStrings}->{UNKNOWN});
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::InputFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::InputFactory::instance = 'org::allbinary::game::input::InputFactory'->new();
        }
        return $org::allbinary::game::input::InputFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $size = scalar(@{$self->{inputIntegerArray}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{inputIntegerArray}->[$index] = $self->{NO_INPUT};
        }
    return $self;
}


sub add {
    my ($self, $id, $input) = @_;
        $self->{inputIntegerArray}->[$id] = $input;
}


sub getInstanceById {
    my ($self, $id) = @_;
        if ($id < 0) {
            $id = -$id;
        }
        if ($id > scalar(@{$self->{inputIntegerArray}})) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Warning id: ")->appendint($id)->toString(), $self, $self->{commonStrings}->{GET_INSTANCE});
            return $self->{NO_INPUT};
        }
        return $self->{inputIntegerArray}->[$id];
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::input::Input;

1;

