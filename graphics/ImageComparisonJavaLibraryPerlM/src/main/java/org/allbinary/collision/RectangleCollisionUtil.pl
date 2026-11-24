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
use parent -norequire,'java::lang::Object';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isCollision_j2_1 {
    my ($class, $rectangle, $point) = @_;
        if ($point->getX() > (int($rectangle->{x}) + $rectangle->getWidth()) || $point->getY() > (int($rectangle->{y}) + $rectangle->getHeight()) || $point->getX() < $rectangle->{x} || $point->getY() < $rectangle->{y}) {
            return 0;
        } else {
            return 1;
        }
}


sub isCollision_j2_2 {
    my ($class, $rectangle1, $rectangle2) = @_;
        return 'org::allbinary::collision::RectangleCollisionUtil'->isCollision($rectangle1->{x}, $rectangle1->{y}, $rectangle1->{x} + $rectangle1->{width}, $rectangle1->{y} + $rectangle1->{height}, $rectangle2->{x}, $rectangle2->{y}, $rectangle2->{x} + $rectangle2->{width}, $rectangle2->{y} + $rectangle2->{height});
}


sub isCollision_j8 {
    my ($class, $rectX1, $rectY1, $rectX2, $rectY2, $rect2X1, $rect2Y1, $rect2X2, $rect2Y2) = @_;
        if ($rect2X1 >= $rectX2 || $rect2Y1 >= $rectY2 || $rect2X2 <= $rectX1 || $rect2Y2 <= $rectY1) {
            return 0;
        } else {
            return 1;
        }
}

sub isCollision {
    my ($invocant, @arguments) = @_;
    return $invocant->isCollision_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->isCollision_j8(@arguments) if scalar(@arguments) == 8;
    die "No method isCollision takes " . scalar(@arguments) . " arguments";
}

sub isCollision_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->isCollision_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->isCollision_j2_2(@arguments);
}

use java::lang::Object ();
# use java::awt::Rectangle ();
use org::allbinary::graphics::GPoint ();

1;

