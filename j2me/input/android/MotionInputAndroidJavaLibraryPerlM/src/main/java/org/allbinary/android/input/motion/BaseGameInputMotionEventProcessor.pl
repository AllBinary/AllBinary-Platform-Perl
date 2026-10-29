#
# AllBinary Open License Version 1
# Copyright (c) 2009 AllBinary
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

package org::allbinary::android::input::motion::BaseGameInputMotionEventProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::MotionEventProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{gameMotionGestureListener} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{gameMotionGestureListener} = 'org::allbinary::input::motion::gesture::observer::GameMotionGestureListener'->new('org::allbinary::input::motion::gesture::observer::MotionGestureReceiveInterfaceFactory'->getInstance());
        $self->addListener();
    return $self;
}


sub process {
    my ($self, $motionEvent) = @_;
}


sub addListener {
    my ($self) = @_;
        my $motionGesturesHandler = 'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance();
        $motionGesturesHandler->addListenerInterface($self->{gameMotionGestureListener});
}

use android::view::MotionEvent;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::input::motion::gesture::observer::GameMotionGestureListener;
use org::allbinary::input::motion::gesture::observer::MotionGestureReceiveInterfaceFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::android::input::motion::MotionEventProcessor;

1;

