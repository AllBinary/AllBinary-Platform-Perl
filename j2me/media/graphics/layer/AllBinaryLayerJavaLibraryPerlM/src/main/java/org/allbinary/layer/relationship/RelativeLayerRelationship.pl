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

package org::allbinary::layer::relationship::RelativeLayerRelationship;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::RelativeRelationship';


sub _init_fields {
    my ($self) = @_;
    $self->{layer} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
}


sub new {
    my ($class, $layer, $point, $typesAllowedList) = @_;
    my $self = $class->SUPER::new($point, $typesAllowedList);
    $self->_init_fields();
        # super(...) made $self above
        $self->{layer} = $layer;
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->{layer}->getXP() + $self->SUPER::getX();
}


sub getY {
    my ($self) = @_;
        return $self->{layer}->getYP() + $self->SUPER::getY();
}


sub getZ {
    my ($self) = @_;
        return $self->{layer}->getZP() + $self->SUPER::getZ();
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::RelativeRelationship;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::util::BasicArrayList;

1;

