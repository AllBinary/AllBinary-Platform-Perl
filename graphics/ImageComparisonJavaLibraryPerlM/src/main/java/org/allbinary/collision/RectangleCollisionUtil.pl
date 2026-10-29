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

package org::allbinary::collision::RectangleCollisionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isCollision {
    my ($class, $rectangle, $point) = @_;
        if ($point->getX() > (int($rectangle->{x}) + $rectangle->getWidth()) || $point->getY() > (int($rectangle->{y}) + $rectangle->getHeight()) || $point->getX() < $rectangle->{x} || $point->getY() < $rectangle->{y}) {
            return 0;
        } else {
            return 1;
        }
}


# Java overloaded method: Perl keeps the last definition
sub isCollision {
    my ($class, $rectangle1, $rectangle2) = @_;
        return 'org::allbinary::collision::RectangleCollisionUtil'->isCollision($rectangle1->{x}, $rectangle1->{y}, $rectangle1->{x} + $rectangle1->{width}, $rectangle1->{y} + $rectangle1->{height}, $rectangle2->{x}, $rectangle2->{y}, $rectangle2->{x} + $rectangle2->{width}, $rectangle2->{y} + $rectangle2->{height});
}


# Java overloaded method: Perl keeps the last definition
sub isCollision {
    my ($class, $rectX1, $rectY1, $rectX2, $rectY2, $rect2X1, $rect2Y1, $rect2X2, $rect2Y2) = @_;
        if ($rect2X1 >= $rectX2 || $rect2Y1 >= $rectY2 || $rect2X2 <= $rectX1 || $rect2Y2 <= $rectY1) {
            return 0;
        } else {
            return 1;
        }
}

# use java::awt;
use org::allbinary::graphics::GPoint;

1;

