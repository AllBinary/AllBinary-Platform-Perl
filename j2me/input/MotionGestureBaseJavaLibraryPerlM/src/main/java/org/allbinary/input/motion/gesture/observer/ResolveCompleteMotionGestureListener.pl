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

package org::allbinary::input::motion::gesture::observer::ResolveCompleteMotionGestureListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::gesture::observer::CompleteMotionGestureListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF("MotionGesture to CompleteMotionGesture Reciever", $self, $commonStrings->{CONSTRUCTOR});
        'org::allbinary::game::input::CompleteMotionGestureInputEventHandler'->getInstance()->addListener('org::allbinary::game::input::motion::action::GameKeyFromMotionGestureEventListener'->new());
    return $self;
}


# throws Exception
sub onMotionGestureCompleted {
    my ($self, $list) = @_;
        my $configuration = 'org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory'->getInstance();
        my $commandActionsList = $configuration->getAssociateCommandActionsList();
        my $size = $commandActionsList->size();
        for (my $index = $size - 1; $index >= 0; $index--) {
            my $association = $commandActionsList->{objectArray}->[$index];
            if ($association->isMotionGestureArrayEquals($list) == 1) {
                my $completeMotionGestureInputEvent = $association->getCommandAction();
                'org::allbinary::game::input::CompleteMotionGestureInputEventHandler'->getInstance()->fireEvent($completeMotionGestureInputEvent);
                last;
            }
        }
}

use org::allbinary::game::input::CompleteMotionGestureInputEventHandler;
use org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEvent;
use org::allbinary::game::input::motion::action::GameKeyFromMotionGestureEventListener;
use org::allbinary::input::motion::gesture::MotionGestureToMotionGestureActionAssociation;
use org::allbinary::input::motion::gesture::configuration::MotionGestureConfiguration;
use org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::input::motion::gesture::observer::CompleteMotionGestureListenerInterface;

1;

