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

package org::allbinary::math::RectangleCollisionPointUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub allPointsInside {
    my ($class, $rectX1, $rectY1, $rectX2, $rectY2, $list) = @_;
        my $rectangleCollisionUtil = 'org::allbinary::math::RectangleCollisionUtil'->getInstance();
        my $point = undef;
        for (my $index = $list->size(); --$index >= 0; ) {
            $point = $list->{objectArray}->[$index];
            if (!$rectangleCollisionUtil->isInside($rectX1, $rectY1, $rectX2, $rectY2, $point->getX(), $point->getY())) {
                return 0;
            }
        }
        return 1;
}


sub allPointsInsideCell {
    my ($class, $rectX1, $rectY1, $rectX2, $rectY2, $list, $xCellSize, $yCellSize) = @_;
        my $rectangleCollisionUtil = 'org::allbinary::math::RectangleCollisionUtil'->getInstance();
        my $point = undef;
        for (my $index = $list->size(); --$index >= 0; ) {
            $point = $list->{objectArray}->[$index];
            if (!$rectangleCollisionUtil->isInside($rectX1, $rectY1, $rectX2, $rectY2, $point->getX() * $xCellSize, $point->getY() * $yCellSize)) {
                return 0;
            }
        }
        return 1;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::util::BasicArrayList;
use org::allbinary::math::RectangleCollisionUtil;

1;

