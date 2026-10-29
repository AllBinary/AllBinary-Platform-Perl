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

package org::allbinary::logic::math::vector::MathVector;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::math::vector::MathVectorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{magnitudeBasicDecimal} = undef;
    $self->{direction} = undef;
    $self->{resultBasicDecimal} = undef;
}


sub new {
    my ($class, $magnitudeBasicDecimal, $direction) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{magnitudeBasicDecimal} = $magnitudeBasicDecimal;
        $self->{direction} = $direction;
    return $self;
}


sub getMagnitude {
    my ($self) = @_;
        return $self->{magnitudeBasicDecimal};
}


sub getDirection {
    my ($self) = @_;
        return $self->{direction};
}


sub getResult {
    my ($self) = @_;
        return $self->{resultBasicDecimal};
}

use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::math::vector::MathVectorInterface;

1;

