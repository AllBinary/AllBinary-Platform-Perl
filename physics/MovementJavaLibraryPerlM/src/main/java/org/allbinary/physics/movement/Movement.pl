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

package org::allbinary::physics::movement::Movement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::MovementInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($self, $speedBasicDecimal, $angle, $otherAngle) = @_;
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
}


sub stop {
    my ($self) = @_;
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::physics::movement::MovementInterface;

1;

