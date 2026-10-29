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

package org::allbinary::logic::math::vector::YAxisMathVector;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::math::vector::MathVector';



sub new {
    my ($class, $magnitudeBasicDecimal, $direction) = @_;
    my $self = $class->SUPER::new($magnitudeBasicDecimal, $direction);
        # super(...) made $self above
        $self->calculate();
    return $self;
}


sub getResult {
    my ($self) = @_;
        return $self->{resultBasicDecimal};
}


sub calculate {
    my ($self) = @_;
        my $result = 'org::allbinary::logic::math::vector::YAxisMathVectorUtil'->calculate($self->getMagnitude()->getUnscaled(), $self->getDirection());
        $self->{resultBasicDecimal} = 'org::allbinary::logic::math::BasicDecimal'->new($result);
}

use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::math::vector::MathVector;
use org::allbinary::logic::math::vector::YAxisMathVectorUtil;

1;

