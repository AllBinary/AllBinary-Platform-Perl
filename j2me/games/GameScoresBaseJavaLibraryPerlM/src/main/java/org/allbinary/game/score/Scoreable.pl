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
use parent -norequire,'java::lang::Object','org::allbinary::game::score::ScoreableInterface';

tie our $ID, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(3) };

sub _init_fields {
    my ($self) = @_;
    $self->{points} = undef;
}


sub new {
    my ($class, $points) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::math::SmallIntegerSingletonFactory ();
use org::allbinary::game::score::ScoreableInterface ();

1;

