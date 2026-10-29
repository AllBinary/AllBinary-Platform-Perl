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

package org::allbinary::math::RectangleCollisionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::math::RectangleCollisionUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::math::RectangleCollisionUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isCollision {
    my ($self, $rectX1, $rectY1, $rectX2, $rectY2, $rect2X1, $rect2Y1, $rect2X2, $rect2Y2) = @_;
        if ($rect2X1 >= $rectX2 || $rect2Y1 >= $rectY2 || $rect2X2 <= $rectX1 || $rect2Y2 <= $rectY1) {
            return 0;
        } else {
            return 1;
        }
}


sub isInside {
    my ($self, $rectX1, $rectY1, $rectX2, $rectY2, $x, $y) = @_;
        if ($x >= $rectX2 || $y >= $rectY2 || $x <= $rectX1 || $y <= $rectY1) {
            return 0;
        } else {
            return 1;
        }
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;

1;

