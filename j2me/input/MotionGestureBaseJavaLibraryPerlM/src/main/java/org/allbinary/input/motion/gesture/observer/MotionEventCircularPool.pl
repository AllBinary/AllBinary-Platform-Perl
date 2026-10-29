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

package org::allbinary::input::motion::gesture::observer::MotionEventCircularPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{MIN} = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{LAST_MOTION}->getId();
    $self->{eventPool} = 'org::allbinary::logic::util::event::AllBinaryEventCircularPool'->new(('org::allbinary::game::input::InputFactory'->getInstance()->{MAX} - 1) - $self->{MIN});
}


sub createPool {
    my ($class, $id) = @_;
        return 'org::allbinary::input::motion::gesture::observer::MotionEventCircularPool'->new($id);
}


sub new {
    my ($class, $id) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{eventPool}->initAllBinaryEventCircularPool('org::allbinary::input::motion::gesture::observer::MotionEventFactory'->new($self->{eventPool}, $id));
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $motionGestureInput) = @_;
        return $self->{eventPool}->getInstance($motionGestureInput->getId() - $self->{MIN});
}

use org::allbinary::game::input::InputFactory;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::logic::util::event::AllBinaryEventCircularPool;
use org::allbinary::input::motion::gesture::observer::MotionEventFactory;

1;

