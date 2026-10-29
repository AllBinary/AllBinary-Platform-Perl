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

package org::allbinary::game::physics::velocity::DragVelocityBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::physics::velocity::VelocityBehaviorBase';

our $instance = 'org::allbinary::game::physics::velocity::DragVelocityBehavior'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub reduce {
    my ($self, $velocityProperties, $nominator, $denominator) = @_;
        if ($velocityProperties->getVelocityXBasicDecimalP()->getUnscaled() != 0) {
            my $basicDecimal = $velocityProperties->getVelocityXBasicDecimalP();
            $basicDecimal->multiplyint($nominator);
            $basicDecimal->divideint($denominator);
        }
        if ($velocityProperties->getVelocityYBasicDecimalP()->getUnscaled() != 0) {
            my $basicDecimal = $velocityProperties->getVelocityYBasicDecimalP();
            $basicDecimal->multiplyint($nominator);
            $basicDecimal->divideint($denominator);
        }
}


sub reduceX {
    my ($self, $velocityProperties, $nominator, $denominator) = @_;
        my $basicDecimal = $velocityProperties->getVelocityXBasicDecimalP();
        if ($basicDecimal->getUnscaled() != 0) {
            $basicDecimal->multiplyint($nominator);
            $basicDecimal->divideint($denominator);
        }
}


sub reduceY {
    my ($self, $velocityProperties, $nominator, $denominator) = @_;
        if ($velocityProperties->getVelocityYBasicDecimalP()->getUnscaled() != 0) {
            my $basicDecimal = $velocityProperties->getVelocityYBasicDecimalP();
            $basicDecimal->multiplyint($nominator);
            $basicDecimal->divideint($denominator);
        }
}

use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::game::physics::velocity::VelocityBehaviorBase;

1;

