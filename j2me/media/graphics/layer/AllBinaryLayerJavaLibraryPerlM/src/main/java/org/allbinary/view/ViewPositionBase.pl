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

package org::allbinary::view::ViewPositionBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::GPoint';

our $NULL_VIEW_POSITION = 'org::allbinary::view::ViewPositionBase'->new(0, 0, 0);


sub new {
    my ($class, $x, $y, $z) = @_;
    my $self = $class->SUPER::new($x, $y, $z);
        # super(...) made $self above
    return $self;
}


sub getX2 {
    my ($self) = @_;
        return $self->getX();
}


sub getY2 {
    my ($self) = @_;
        return $self->getY();
}


sub getZ2 {
    my ($self) = @_;
        return $self->getZ();
}


sub setAllbinaryLayer {
    my ($self, $allbinaryLayer) = @_;
}

use org::allbinary::graphics::GPoint;

1;

