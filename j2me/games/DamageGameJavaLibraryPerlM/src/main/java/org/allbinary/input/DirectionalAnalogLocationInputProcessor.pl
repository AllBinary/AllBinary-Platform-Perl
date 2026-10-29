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

package org::allbinary::input::DirectionalAnalogLocationInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::AnalogLocationInputProcessor','org::allbinary::game::input::GameKeyEventSourceInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{inputProcessorArray} = undef;
    $self->{gameKeyFactory} = 'org::allbinary::game::input::GameKeyFactory'->getInstance();
    $self->{leftGameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
    $self->{rightGameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
    $self->{upGameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
    $self->{downGameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
    $self->{leftTriggerGameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
    $self->{rightTriggerGameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
}


sub new {
    my ($class, $inputProcessorArray) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{inputProcessorArray} = $inputProcessorArray;
        try {
            $self->{leftGameKeyEvent} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForInput($self, $self->{gameKeyFactory}->{LEFT});
            $self->{rightGameKeyEvent} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForInput($self, $self->{gameKeyFactory}->{RIGHT});
            $self->{upGameKeyEvent} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForInput($self, $self->{gameKeyFactory}->{UP});
            $self->{downGameKeyEvent} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForInput($self, $self->{gameKeyFactory}->{DOWN});
            $self->{leftTriggerGameKeyEvent} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForInput($self, $self->{gameKeyFactory}->{KEY_NUM0});
            $self->{rightTriggerGameKeyEvent} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForInput($self, $self->{gameKeyFactory}->{KEY_NUM5});
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub process {
    my ($self, $allbinaryLayerManager, $analogLocationInput) = @_;
        try {
            my $customGPoint = undef;
            $customGPoint = $analogLocationInput->getCustomGPoint();
            my $x = $customGPoint->getX();
            my $y = $customGPoint->getY();
            my $leftTrigger = $analogLocationInput->getLeftTrigger();
            my $rightTrigger = $analogLocationInput->getRightTrigger();
            if ($x < 0) {
                $self->{inputProcessorArray}->[$self->{leftGameKeyEvent}->getKey()]->processAnalog($allbinaryLayerManager, $self->{leftGameKeyEvent}, $x);
            } elsif ($x > 0) {
                $self->{inputProcessorArray}->[$self->{rightGameKeyEvent}->getKey()]->processAnalog($allbinaryLayerManager, $self->{rightGameKeyEvent}, $x);
            }
            if ($y < 0) {
                $self->{inputProcessorArray}->[$self->{downGameKeyEvent}->getKey()]->processAnalog($allbinaryLayerManager, $self->{downGameKeyEvent}, $y);
            } elsif ($y > 0) {
                $self->{inputProcessorArray}->[$self->{upGameKeyEvent}->getKey()]->processAnalog($allbinaryLayerManager, $self->{upGameKeyEvent}, $y);
            }
            if ($leftTrigger > 0) {
                $self->{inputProcessorArray}->[$self->{leftTriggerGameKeyEvent}->getKey()]->processAnalog($allbinaryLayerManager, $self->{leftTriggerGameKeyEvent}, $leftTrigger);
            }
            if ($rightTrigger > 0) {
                $self->{inputProcessorArray}->[$self->{rightTriggerGameKeyEvent}->getKey()]->processAnalog($allbinaryLayerManager, $self->{rightTriggerGameKeyEvent}, $rightTrigger);
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put("Unable to process analog input", $self, $commonStrings->{PROCESS}, $e);
        }
}


sub getSourceId {
    my ($self) = @_;
        return 0;
}

use org::allbinary::android::input::motion::AnalogLocationInputProcessor;
use org::allbinary::game::input::GameInputProcessor;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::analog::AnalogLocationInput;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::graphics::CustomGPoint;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

