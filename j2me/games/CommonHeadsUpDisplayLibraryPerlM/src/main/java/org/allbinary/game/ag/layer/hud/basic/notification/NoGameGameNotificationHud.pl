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

package org::allbinary::game::ag::layer::hud::basic::notification::NoGameGameNotificationHud;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{TOPCENTER}, 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{HORIZONTAL}, 2, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED});
        # super(...) made $self above
        $self->{updateMaxWidth} = 40;
        $self->{updateMaxHeight} = 14;
    return $self;
}

use java::lang::Object ();
use org::allbinary::game::graphics::hud::BasicHudFactory ();
use org::allbinary::graphics::color::BasicColorFactory ();
use org::allbinary::game::ag::layer::hud::basic::notification::GameNotificationHud ();

1;

