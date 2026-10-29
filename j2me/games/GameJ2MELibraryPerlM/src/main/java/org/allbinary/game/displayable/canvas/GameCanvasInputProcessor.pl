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

package org::allbinary::game::displayable::canvas::GameCanvasInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::InputProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{allBinaryGameCanvas} = undef;
    $self->{downGameKeyEventHandler} = 'org::allbinary::game::input::event::DownGameKeyEventHandler'->getInstance();
    $self->{upGameKeyEventHandler} = 'org::allbinary::game::input::event::UpGameKeyEventHandler'->getInstance();
    $self->{downKeyEventHandler} = 'org::allbinary::game::input::event::DownKeyEventHandler'->getInstance();
    $self->{smallIntegerSingletonFactory} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
    $self->{inputToGameKeyMapping} = 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance()->getInputMapping();
    $self->{NONE} = 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{NONE};
    $self->{gameKeyEventFactory} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
}


sub new {
    my ($class, $allBinaryGameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{allBinaryGameCanvas} = $allBinaryGameCanvas;
        $self->{inputToGameKeyMapping}->init($self->{allBinaryGameCanvas});
    return $self;
}


sub keyPressedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        try {
            my $gameKey = $self->{inputToGameKeyMapping}->getInstanceForCanvas($self->{allBinaryGameCanvas}, $keyCode);
            if ($gameKey != $self->{NONE}) {
                my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($self->{allBinaryGameCanvas}, $gameKey);
                $self->{downGameKeyEventHandler}->fireEvent($gameKeyEvent);
                $self->{downGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
            } else {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{NO_KEY})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{ADD_KEY_EVENT});
            }
            my $keyCodeAsInteger = $self->{smallIntegerSingletonFactory}->getAtNoThrow($keyCode);
            $self->{downKeyEventHandler}->fireEventI($keyCodeAsInteger);
            $self->{downKeyEventHandler}->getInstanceForDevice($deviceId)->fireEventI($keyCodeAsInteger);
        } catch ($e) {
            $self->{logUtil}->put("Key Event Error", $self, $self->{gameInputStrings}->{ADD_KEY_EVENT}, $e);
        }
}


sub keyReleasedByDevice {
    my ($self, $canvas, $keyCode, $deviceId) = @_;
        $self->removeGameKeyEvent($canvas, $keyCode, $deviceId, 0);
}


sub removeGameKeyEvent {
    my ($self, $canvas, $keyCode, $deviceId, $repeated) = @_;
        try {
            my $gameKey = $self->{inputToGameKeyMapping}->getInstanceForCanvas($canvas, $keyCode);
            if ($gameKey != $self->{NONE}) {
                my $gameKeyEventSourceInterface = $canvas;
                my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($gameKeyEventSourceInterface, $gameKey);
                $self->{upGameKeyEventHandler}->fireEvent($gameKeyEvent);
                $self->{upGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
            } else {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{NO_KEY})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{REMOVE_KEY_EVENT});
            }
        } catch ($e) {
            $self->{logUtil}->put("Key Event Error", $self, $self->{gameInputStrings}->{REMOVE_KEY_EVENT}, $e);
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::InputProcessor;
use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::event::DownGameKeyEventHandler;
use org::allbinary::game::input::event::DownKeyEventHandler;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::event::UpGameKeyEventHandler;
use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;

1;

