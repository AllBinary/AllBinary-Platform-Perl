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

package org::allbinary::input::motion::button::TouchButtonsPaintableComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::ProcessPaintable','org::allbinary::game::input::CompleteMotionGestureInputEventListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{inputMappingInterface} = undef;
    $self->{touchButtonsPaintable} = undef;
    $self->{timeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(250);
    $self->{released} = 1;
    $self->{METHOD_NAME} = "onCompleteMotionGestureInputEvent";
    $self->{RELEASE} = "Ignoring: MotionGestureInput Release";
    $self->{FAST_REPEAT} = "Ignoring: MotionGestureInput Repeated To Quickly";
    $self->{IGNORE} = "Ignoring: Until Released";
}


sub new {
    my ($class, $inputMappingInterface, $basicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{inputMappingInterface} = $inputMappingInterface;
        'org::allbinary::game::input::CompleteMotionGestureInputEventHandler'->getInstance()->addListenerInterface($self);
        $self->{touchButtonsPaintable} = 'org::allbinary::input::motion::button::TouchButtonsMappingPaintable'->new($basicColor);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onCompleteMotionGestureInputEvent {
    my ($self, $completeMotionGestureInputEvent) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "onCompleteMotionGestureInputEvent");
            my $touchMotionGestureFactory = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
            my $gameKeyCompleteMotionGestureInputEvent = $completeMotionGestureInputEvent;
            my $gameKey = $gameKeyCompleteMotionGestureInputEvent->getGameKey();
            my $motionGestureInput = $completeMotionGestureInputEvent->getMotionGestureInput();
            if ($motionGestureInput == $touchMotionGestureFactory->{RELEASED}) {
                $self->{logUtil}->putF($self->{RELEASE}, $self, $self->{METHOD_NAME});
                $self->{released} = 1;
                return;
            }
            if ($motionGestureInput == 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{NO_MOTION} && !$self->{timeHelper}->isTimeTNT()) {
                $self->{logUtil}->putF($self->{FAST_REPEAT}, $self, $self->{METHOD_NAME});
                return;
            }
            if (!$self->{released}) {
                $self->{logUtil}->putF($self->{IGNORE}, $self, $self->{METHOD_NAME});
                return;
            }
            $self->{released} = 0;
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("GameKey: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($gameKey))->append(" MotionGestureInput: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($motionGestureInput))->toString(), $self, $self->{METHOD_NAME});
            $self->{inputMappingInterface}->processInputMapping($gameKey, $motionGestureInput);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{METHOD_NAME}, $e);
        }
}


sub process {
    my ($self) = @_;
        'org::allbinary::game::input::CompleteMotionGestureInputEventHandler'->getInstance()->removeListener($self);
}

use org::allbinary::game::input::CompleteMotionGestureInputEvent;
use org::allbinary::game::input::CompleteMotionGestureInputEventHandler;
use org::allbinary::game::input::CompleteMotionGestureInputEventListenerInterface;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::mapping::InputMappingInterface;
use org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEvent;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::paint::ProcessPaintable;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::input::motion::button::TouchButtonsMappingPaintable;

1;

