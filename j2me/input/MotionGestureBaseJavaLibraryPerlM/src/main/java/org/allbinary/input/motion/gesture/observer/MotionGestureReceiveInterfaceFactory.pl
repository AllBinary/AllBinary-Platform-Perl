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

package org::allbinary::input::motion::gesture::observer::MotionGestureReceiveInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        my $configuration = 'org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory'->getInstance();
        if (!$configuration->isExecutingActionsAllowed()) {
            return 'org::allbinary::input::motion::gesture::observer::NullCompleteMotionGestureReceiver'->new();
        } else {
            return 'org::allbinary::input::motion::gesture::observer::ResolveCompleteMotionGestureListener'->new();
        }
}

use org::allbinary::input::motion::gesture::configuration::MotionGestureConfiguration;
use org::allbinary::input::motion::gesture::configuration::MotionGestureConfigurationFactory;
use org::allbinary::input::motion::gesture::observer::ResolveCompleteMotionGestureListener;
use org::allbinary::input::motion::gesture::observer::NullCompleteMotionGestureReceiver;

1;

