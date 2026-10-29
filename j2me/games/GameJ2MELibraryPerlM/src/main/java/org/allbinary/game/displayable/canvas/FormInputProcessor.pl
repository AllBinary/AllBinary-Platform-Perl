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

package org::allbinary::game::displayable::canvas::FormInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::InputProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{gameKeyEventFactory} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
    $self->{downKeyEventHandler} = 'org::allbinary::game::input::event::DownKeyEventHandler'->getInstance();
    $self->{upGameKeyEventHandler} = 'org::allbinary::game::input::event::UpGameKeyEventHandler'->getInstance();
    $self->{inputFactory} = 'org::allbinary::game::input::InputFactory'->getInstance();
    $self->{platformKeyFactory} = 'org::allbinary::game::input::PlatformKeyFactory'->getInstance();
    $self->{allBinaryGameCanvas} = undef;
}


sub new {
    my ($class, $allBinaryGameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{allBinaryGameCanvas} = $allBinaryGameCanvas;
    return $self;
}


sub keyPressedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        try {
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{inputFactory}->{KEY_CODE_LABEL})->appendint($keyCode)->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{inputFactory}->{DEVICE_ID_LABEL})->appendint($deviceId)->toString(), $self, $self->{gameInputStrings}->{KEY_PRESSED});
            my $input = $self->{inputFactory}->getInstanceById($keyCode);
            my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($self->{allBinaryGameCanvas}, $input);
            $self->{downKeyEventHandler}->fireEventForGameKeyEvent($gameKeyEvent);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{ADD_KEY_EVENT}, $e);
        }
}


sub keyReleasedByDevice {
    my ($self, $canvas, $keyCode, $deviceId) = @_;
        try {
            my $input = $self->{inputFactory}->getInstanceById($keyCode);
            if ($self->{platformKeyFactory}->isEnter($input)) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{inputFactory}->{KEY_CODE_LABEL})->appendint($keyCode)->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{inputFactory}->{DEVICE_ID_LABEL})->appendint($deviceId)->toString(), $self, $self->{gameInputStrings}->{KEY_RELEASED});
                my $gameKey = 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{KEY_NUM0};
                my $gameKeyEventSourceInterface = $canvas;
                my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($gameKeyEventSourceInterface, $gameKey);
                $self->{upGameKeyEventHandler}->fireEvent($gameKeyEvent);
                $self->{upGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{ADD_KEY_EVENT}, $e);
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::InputProcessor;
use org::allbinary::game::input::PlatformKeyFactory;
use org::allbinary::game::input::event::DownKeyEventHandler;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::event::UpGameKeyEventHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;

1;

