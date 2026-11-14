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

package org::allbinary::game::ag::layer::hud::basic::notification::NoGameNotificationHudSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::game::ag::layer::hud::basic::notification::NoGameNotificationHudSingleton'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameNotificationHud} = $org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud::NULL_GAME_NOTIFICATION;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::ag::layer::hud::basic::notification::NoGameNotificationHudSingleton::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        try {
            my $basicHudFactory = 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance();
            $self->{gameNotificationHud} = 'org::allbinary::game::ag::layer::hud::basic::notification::NoGameGameNotificationHud'->new();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub getGameNotificationHud {
    my ($self) = @_;
        return $self->{gameNotificationHud};
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::graphics::hud::BasicHudFactory ();
use org::allbinary::graphics::color::BasicColorFactory ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud ();
use org::allbinary::game::ag::layer::hud::basic::notification::NoGameGameNotificationHud ();

1;

