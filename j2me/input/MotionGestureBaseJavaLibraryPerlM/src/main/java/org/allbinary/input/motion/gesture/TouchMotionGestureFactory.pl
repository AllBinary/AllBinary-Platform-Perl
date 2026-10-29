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

package org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
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
    $self->{PRESSED} = undef;
    $self->{RELEASED} = undef;
    $self->{DIAGONAL_DOWN_RIGHT} = undef;
    $self->{DIAGONAL_DOWN_LEFT} = undef;
    $self->{DIAGONAL_UP_RIGHT} = undef;
    $self->{DIAGONAL_UP_LEFT} = undef;
    $self->{SCROLL_UP} = undef;
    $self->{SCROLL_DOWN} = undef;
    $self->{NO_MOTION} = undef;
    $self->{LAST_MOTION} = undef;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::motion::gesture::TouchMotionGestureFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::motion::gesture::TouchMotionGestureFactory::instance = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->new();
        }
        return $org::allbinary::input::motion::gesture::TouchMotionGestureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $MAX = 'org::allbinary::game::input::InputFactory'->getInstance()->{MAX};
        $self->{LEFT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 3, "Left Touch");
        $self->{RIGHT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 4, "Right Touch");
        $self->{UP} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 5, "Up Touch");
        $self->{DOWN} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 6, "Down Touch");
        $self->{PRESSED} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 7, "Screen Press");
        $self->{RELEASED} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 8, "Released");
        $self->{DIAGONAL_DOWN_RIGHT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 9, "Diagonal Dn R");
        $self->{DIAGONAL_DOWN_LEFT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 10, "Diagonal Dn L");
        $self->{DIAGONAL_UP_RIGHT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 11, "Diagonal Up R");
        $self->{DIAGONAL_UP_LEFT} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 12, "Diagonal Up L");
        $self->{SCROLL_UP} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 13, "Scroll Up");
        $self->{SCROLL_DOWN} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 14, "Scroll Down");
        $self->{NO_MOTION} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 2, "No Motion");
        $self->{LAST_MOTION} = 'org::allbinary::input::motion::gesture::MotionGestureInput'->new($MAX - 19, "Last Motion");
    return $self;
}

use org::allbinary::game::input::InputFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::input::motion::gesture::MotionGestureInput;

1;

