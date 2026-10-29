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

package org::allbinary::input::motion::gyro::action::UpOrientationInputToGameKeyEventAction;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEvent';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::motion::gyro::action::UpOrientationInputToGameKeyEventAction::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::motion::gyro::action::UpOrientationInputToGameKeyEventAction::instance = 'org::allbinary::input::motion::gyro::action::UpOrientationInputToGameKeyEventAction'->new();
        }
        return $org::allbinary::input::motion::gyro::action::UpOrientationInputToGameKeyEventAction::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new("Up Action", 'org::allbinary::input::gyro::OrientationMotionGestureFactory'->getInstance()->{UP}, 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance()->getInputMapping());
        # super(...) made $self above
    return $self;
}

use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEvent;
use org::allbinary::input::gyro::OrientationMotionGestureFactory;
use org::allbinary::logic::NullUtil;

1;

