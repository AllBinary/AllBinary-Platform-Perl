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

our $instance = 'org::allbinary::game::ag::layer::hud::basic::notification::NoGameNotificationHudSingleton'->new();

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
    $self->_init_fields();
        try {
            my $basicHudFactory = 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance();
            {
            package org::allbinary::game::ag::layer::hud::basic::notification::NoGameGameNotificationHud;
            use strict;
            use warnings;
            use feature 'try';
            no warnings 'experimental::try';
            use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud';
            
            

            sub new {
                my ($class) = @_;
                my $self = $class->SUPER::new($self->{basicHudFactory}->{TOPCENTER}, $self->{basicHudFactory}->{HORIZONTAL}, 2, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED});
                    # super(...) made $self above
                    $self->{updateMaxWidth} = 40;
                    $self->{updateMaxHeight} = 14;
                return $self;
            }
            }

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

use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud;

1;

