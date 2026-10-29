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

package org::allbinary::input::gyro::AllBinaryOrientationSensor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::AllBinarySensor';


sub _init_fields {
    my ($self) = @_;
    $self->{sensorDataFloatArray} = 'org::allbinary::logic::math::PrimitiveFloatUtil'->getArrayInstance();
    $self->{listener} = 'org::allbinary::game::input::motion::action::NoCompleteMotionGestureInputEventListener'->getInstance();
}


sub setCompleteMotionGestureInputEventListener {
    my ($self, $completeMotionGestureInputEventListenerInterface) = @_;
        $self->{listener} = $completeMotionGestureInputEventListenerInterface;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getOrientation {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}

use org::allbinary::game::input::CompleteMotionGestureInputEventListenerInterface;
use org::allbinary::game::input::motion::action::NoCompleteMotionGestureInputEventListener;
use org::allbinary::input::AllBinarySensor;
use org::allbinary::logic::math::Orientation;
use org::allbinary::logic::math::PrimitiveFloatUtil;

1;

