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

package org::allbinary::input::motion::gesture::TrackballMotionGestureFactory;
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
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::motion::gesture::TrackballMotionGestureFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::motion::gesture::TrackballMotionGestureFactory::instance = 'org::allbinary::input::motion::gesture::TrackballMotionGestureFactory'->new();
        }
        return $org::allbinary::input::motion::gesture::TrackballMotionGestureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $MAX = 'org::allbinary::game::input::InputFactory'->getInstance()->{MAX};
        $self->{LEFT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 26, "L Trackball");
        $self->{RIGHT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 27, "R Trackball");
        $self->{UP} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 28, "Up Trackball");
        $self->{DOWN} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 29, "D Trackball");
    return $self;
}

use org::allbinary::game::input::InputFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::input::motion::gesture::MotionGestureInput;

1;

