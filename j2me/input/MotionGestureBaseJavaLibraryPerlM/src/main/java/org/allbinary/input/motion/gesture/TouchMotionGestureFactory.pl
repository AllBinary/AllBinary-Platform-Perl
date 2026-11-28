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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT} };

sub _init_fields {
    my ($self) = @_;
    $self->{LEFT} = undef unless exists $self->{LEFT};
    $self->{RIGHT} = undef unless exists $self->{RIGHT};
    $self->{UP} = undef unless exists $self->{UP};
    $self->{DOWN} = undef unless exists $self->{DOWN};
    $self->{PRESSED} = undef unless exists $self->{PRESSED};
    $self->{RELEASED} = undef unless exists $self->{RELEASED};
    $self->{DIAGONAL_DOWN_RIGHT} = undef unless exists $self->{DIAGONAL_DOWN_RIGHT};
    $self->{DIAGONAL_DOWN_LEFT} = undef unless exists $self->{DIAGONAL_DOWN_LEFT};
    $self->{DIAGONAL_UP_RIGHT} = undef unless exists $self->{DIAGONAL_UP_RIGHT};
    $self->{DIAGONAL_UP_LEFT} = undef unless exists $self->{DIAGONAL_UP_LEFT};
    $self->{SCROLL_UP} = undef unless exists $self->{SCROLL_UP};
    $self->{SCROLL_DOWN} = undef unless exists $self->{SCROLL_DOWN};
    $self->{NO_MOTION} = undef unless exists $self->{NO_MOTION};
    $self->{LAST_MOTION} = undef unless exists $self->{LAST_MOTION};
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
    _init_fields($self);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::input::InputFactory ();
use org::allbinary::logic::NullUtil ();
use org::allbinary::input::motion::gesture::MotionGestureInput ();

1;

