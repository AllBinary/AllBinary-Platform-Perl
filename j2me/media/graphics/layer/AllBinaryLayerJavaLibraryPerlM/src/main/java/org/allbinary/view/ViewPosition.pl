# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::view::ViewPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::view::ViewPositionBase';


sub _init_fields {
    my ($self) = @_;
    $self->{allbinaryLayer} = $org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER;
}


sub getInstanceD {
    my ($class) = @_;
        return 'org::allbinary::view::ViewPosition'->new(0, 0, 0);
}


sub new {
    my ($class, $x, $y, $z) = @_;
    my $self = $class->SUPER::new($x, $y, $z);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->{allbinaryLayer}->getXP();
}


sub getY {
    my ($self) = @_;
        return $self->{allbinaryLayer}->getYP();
}


sub getZ {
    my ($self) = @_;
        return $self->{allbinaryLayer}->getZP();
}


sub getX2 {
    my ($self) = @_;
        return $self->getX() + $self->{allbinaryLayer}->getWidth();
}


sub getY2 {
    my ($self) = @_;
        return $self->getY() + $self->{allbinaryLayer}->getHeight();
}


sub getZ2 {
    my ($self) = @_;
        return int(($self->getZ() + $self->{allbinaryLayer}->getDepth()));
}


sub setAllbinaryLayer {
    my ($self, $allbinaryLayer) = @_;
        $self->{allbinaryLayer} = $allbinaryLayer;
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::view::ViewPositionBase;

1;

