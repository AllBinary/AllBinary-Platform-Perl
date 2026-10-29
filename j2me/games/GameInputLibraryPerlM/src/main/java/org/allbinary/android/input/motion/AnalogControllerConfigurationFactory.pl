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

package org::allbinary::android::input::motion::AnalogControllerConfigurationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::android::input::motion::AnalogControllerConfigurationFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SCALE_FACTOR} = 'org::allbinary::logic::math::ScaleFactorFactory'->getInstance()->{DEFAULT_SCALE_FACTOR};
    $self->{SCALE_VALUE} = 'org::allbinary::logic::math::ScaleFactorFactory'->getInstance()->{DEFAULT_SCALE_VALUE};
    $self->{available} = 0;
    $self->{analogControllerConfigurationEvent} = 'org::allbinary::android::input::motion::event::AnalogControllerConfigurationEvent'->new($self);
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::input::motion::AnalogControllerConfigurationFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isAvailable {
    my ($self) = @_;
        return $self->{available};
}


# throws Exception
sub setAvailable {
    my ($self, $available) = @_;
        $self->{available} = $available;
        'org::allbinary::android::input::motion::event::AnalogControllerConfigurationEventHandler'->getInstance()->fireEvent($self->{analogControllerConfigurationEvent});
}

use org::allbinary::android::input::motion::event::AnalogControllerConfigurationEvent;
use org::allbinary::android::input::motion::event::AnalogControllerConfigurationEventHandler;
use org::allbinary::logic::math::ScaleFactorFactory;

1;

