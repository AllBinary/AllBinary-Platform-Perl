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

package org::allbinary::game::input::CompleteMotionGestureInputEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject','org::allbinary::game::input::CompleteMotionGestureInputInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{motionGestureInput} = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{NO_MOTION};
}


sub new {
    my ($class, $name, $motionGestureInput) = @_;
    my $self = $class->SUPER::new($motionGestureInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->setName($name);
        try {
            $self->setMotionGestureInput($motionGestureInput);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "InputToGameKeyEventAction", $e);
        }
    return $self;
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setMotionGestureInput {
    my ($self, $motionGestureInput) = @_;
        $self->{motionGestureInput} = $motionGestureInput;
}


sub getMotionGestureInput {
    my ($self) = @_;
        return $self->{motionGestureInput};
}

use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::input::CompleteMotionGestureInputInterface;

1;

