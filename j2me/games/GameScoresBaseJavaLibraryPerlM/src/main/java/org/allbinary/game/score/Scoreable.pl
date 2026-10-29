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

package org::allbinary::game::score::Scoreable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::ScoreableInterface';

our $ID = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(3);

sub _init_fields {
    my ($self) = @_;
    $self->{points} = undef;
}


sub new {
    my ($class, $points) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{points} = $points;
    return $self;
}


sub addPoints {
    my ($self, $points) = @_;
        $self->{points} += $points;
}


sub removePoints {
    my ($self, $points) = @_;
        $self->{points} -= $points;
}


sub setPoints {
    my ($self, $points) = @_;
        $self->{points} = $points;
}


sub getPoints {
    my ($self) = @_;
        return $self->{points};
}

use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::game::score::ScoreableInterface;

1;

