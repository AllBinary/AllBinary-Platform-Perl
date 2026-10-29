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

package org::allbinary::bounds::TopULayerBounds;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::bounds::LayerBounds';



sub new {
    my ($class, $rectangle) = @_;
    my $self = $class->SUPER::new($rectangle);
        # super(...) made $self above
    return $self;
}


sub visit {
    my ($self, $boundsVisitorInterface) = @_;
        if ($boundsVisitorInterface->getX() > $self->{rectangle}->getMaxX()) {
            $boundsVisitorInterface->maxX();
        }
        if ($boundsVisitorInterface->getX() < $self->{rectangle}->getPoint()->getX()) {
            $boundsVisitorInterface->minX();
        }
        if ($boundsVisitorInterface->getY() < $self->{rectangle}->getPoint()->getY()) {
            $boundsVisitorInterface->minY();
        }
}

use org::allbinary::graphics::Rectangle;
use org::allbinary::bounds::LayerBounds;

1;

