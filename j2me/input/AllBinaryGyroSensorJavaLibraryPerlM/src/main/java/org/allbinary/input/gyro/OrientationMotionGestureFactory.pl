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

package org::allbinary::input::gyro::OrientationMotionGestureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{LEFT} = undef;
    $self->{RIGHT} = undef;
    $self->{UP} = undef;
    $self->{DOWN} = undef;
    $self->{ROLL_LEFT} = undef;
    $self->{ROLL_RIGHT} = undef;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::gyro::OrientationMotionGestureFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::gyro::OrientationMotionGestureFactory::instance = 'org::allbinary::input::gyro::OrientationMotionGestureFactory'->new();
        }
        return $org::allbinary::input::gyro::OrientationMotionGestureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $MAX = 'org::allbinary::game::input::InputFactory'->getInstance()->{MAX};
        $self->{LEFT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 20, "Left Orient");
        $self->{RIGHT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 21, "Right Orient");
        $self->{UP} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 22, "Up Orient");
        $self->{DOWN} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 23, "Down Orient");
        $self->{ROLL_LEFT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 24, "Roll Left");
        $self->{ROLL_RIGHT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 25, "Roll Right");
    return $self;
}

use org::allbinary::game::input::InputFactory;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::logic::NullUtil;

1;

