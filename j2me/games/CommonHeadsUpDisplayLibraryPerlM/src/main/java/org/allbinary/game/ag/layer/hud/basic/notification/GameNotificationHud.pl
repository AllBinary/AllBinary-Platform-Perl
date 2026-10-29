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

package org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud','org::allbinary::game::layer::hud::event::GameNotificationListenerInterface';

our $NULL_GAME_NOTIFICATION = 'org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud'->new('org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{TOPCENTER}, 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{HORIZONTAL}, 0, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED});

sub _init_fields {
    my ($self) = @_;
    $self->{METHOD_NAME} = "onGameNotificationEvent";
    $self->{lastGameNotificationEvent} = $org::allbinary::game::ag::layer::hud::basic::notification::GameNotification::NULL_GAME_NOTIFICATION_EVENT;
}


sub new {
    my ($class, $location, $direction, $bufferZone, $basicColor) = @_;
    my $self = $class->SUPER::new($location, $direction, $bufferZone, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub onGameNotificationEvent {
    my ($self, $gameNotificationEvent) = @_;
        if ($self->{lastGameNotificationEvent} != $gameNotificationEvent) {
            $self->{lastGameNotificationEvent} = $gameNotificationEvent;
            $self->{logUtil}->putF($gameNotificationEvent->getString(), $self, $self->{METHOD_NAME});
        }
        $self->add($gameNotificationEvent->getString(), $gameNotificationEvent->getSeconds(), $gameNotificationEvent->getBasicColorP(), $gameNotificationEvent->getPermanent());
}


sub add {
    my ($self, $string, $seconds, $basicColor, $permanent) = @_;
}


# throws Exception
sub processTick {
    my ($self) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}


sub clear {
    my ($self) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::game::layer::hud::event::GameNotificationEvent;
use org::allbinary::game::layer::hud::event::GameNotificationListenerInterface;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::game::ag::layer::hud::basic::notification::GameNotification;

1;

