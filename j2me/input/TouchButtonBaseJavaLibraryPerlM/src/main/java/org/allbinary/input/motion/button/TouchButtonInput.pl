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

package org::allbinary::input::motion::button::TouchButtonInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::Input','org::allbinary::game::input::GameKeyEventSourceInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameKeyEventFactory} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
    $self->{TOUCH_BUTTON_SOURCE_ID} = $self->{gameKeyEventFactory}->{TOUCH_BUTTON_SOURCE_ID};
    $self->{gameKeyEvent} = $org::allbinary::game::input::event::GameKeyEvent::NONE;
}


sub new {
    my ($class, $id, $name) = @_;
    my $self = $class->SUPER::new($id, $name);
    $self->_init_fields();
        # super(...) made $self above
        my $inputFactory = 'org::allbinary::game::input::InputFactory'->getInstance();
        $inputFactory->add($self->getId(), $self);
    return $self;
}


sub update {
    my ($self, $inputToGameKeyMapping) = @_;
        try {
            my $gameKey = $inputToGameKeyMapping->getInstance($self->getId());
            $self->{gameKeyEvent} = $self->{gameKeyEventFactory}->getInstanceForInput($self, $gameKey);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{UPDATE}, $e);
        }
}


sub getSourceId {
    my ($self) = @_;
        return $self->{TOUCH_BUTTON_SOURCE_ID};
}


sub getGameKeyEvent {
    my ($self) = @_;
        return $self->{gameKeyEvent};
}

use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

