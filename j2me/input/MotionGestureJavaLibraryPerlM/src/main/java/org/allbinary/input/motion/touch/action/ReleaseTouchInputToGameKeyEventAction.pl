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

package org::allbinary::input::motion::touch::action::ReleaseTouchInputToGameKeyEventAction;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEvent';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{NONE} = 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{NONE};
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::motion::touch::action::ReleaseTouchInputToGameKeyEventAction::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::motion::touch::action::ReleaseTouchInputToGameKeyEventAction::instance = 'org::allbinary::input::motion::touch::action::ReleaseTouchInputToGameKeyEventAction'->new();
        }
        return $org::allbinary::input::motion::touch::action::ReleaseTouchInputToGameKeyEventAction::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new("Release Action", 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{RELEASED}, 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance()->getInputMapping());
    $self->_init_fields();
        # super(...) made $self above
        try {
            $self->setGameKey($self->{NONE});
            $self->setGameKeyEvent('org::allbinary::game::input::event::GameKeyEventFactory'->getInstance()->getInstanceForInput($self, $self->{NONE}));
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub update {
    my ($self) = @_;
}

use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEvent;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::string::CommonStrings;

1;

