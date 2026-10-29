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

package org::allbinary::input::motion::gesture::observer::GameMotionGestureListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::gesture::observer::MotionGestureEventListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{motionGestureCollection} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{touchGestureCollection} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{signed} = undef;
}


sub new {
    my ($class, $signed) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{signed} = $signed;
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
}


sub onUpMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onDownMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onLeftMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onRightMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onDiagonalDownRightMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onDiagonalDownLeftMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onDiagonalUpRightMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onDiagonalUpLeftMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->onMotionGestureEvent($ev);
}


sub onPressedMotionGestureEvent {
    my ($self, $ev) = @_;
        $self->{touchGestureCollection}->add($ev->getMotionGesture());
}


sub released {
    my ($self, $ev) = @_;
        try {
            $self->{touchGestureCollection}->add($ev->getMotionGesture());
            $self->{signed}->onMotionGestureCompleted($self->{touchGestureCollection});
            $self->{touchGestureCollection}->clear();
        } catch ($e) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{commonStrings}->{EXCEPTION_LABEL});
            $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($ev->getMotionGesture()));
            $self->{logUtil}->put($stringBuffer->toString(), $self, "release", $e);
        }
}


sub onScrolledMotionGestureEvent {
    my ($self, $motionGestureEvent) = @_;
}


sub onMotionGestureEvent {
    my ($self, $ev) = @_;
        try {
            my $motionGestureInput = $ev->getMotionGesture();
            if ($motionGestureInput == 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{PRESSED}) {
                $self->onPressedMotionGestureEvent($ev);
            } elsif ($motionGestureInput == 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{RELEASED}) {
                $self->released($ev);
            } else {
                $self->{motionGestureCollection}->add($motionGestureInput);
                $self->{signed}->onMotionGestureCompleted($self->{motionGestureCollection});
                $self->{motionGestureCollection}->clear();
                $self->{touchGestureCollection}->clear();
            }
        } catch ($e) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{commonStrings}->{EXCEPTION_LABEL});
            $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($ev->getMotionGesture()));
            $self->{logUtil}->put($stringBuffer->toString(), $self, "onMotionGestureEvent", $e);
        }
}

use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::motion::gesture::observer::MotionGestureEventListener;

1;

