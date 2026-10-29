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

# Java interface
package org::allbinary::media::image::comparison::ImageComparatorConstraintsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getMaxNonMatchingPixelDeltas {
    my ($self) = @_;
    die "abstract method getMaxNonMatchingPixelDeltas";
}


sub isCollisionWithAvoidRectangles {
    my ($self, $rectangle) = @_;
    die "abstract method isCollisionWithAvoidRectangles";
}


# Java overloaded method: Perl keeps the last definition
sub isCollisionWithAvoidRectangles {
    my ($self, $point) = @_;
    die "abstract method isCollisionWithAvoidRectangles";
}


sub isColorAllowed {
    my ($self, $frame, $point, $color) = @_;
    die "abstract method isColorAllowed";
}


# throws Exception
sub isImageValid {
    my ($self, $bufferedImage) = @_;
    die "abstract method isImageValid";
}


sub isFrameAllowed {
    my ($self, $frame) = @_;
    die "abstract method isFrameAllowed";
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::graphics::GPoint;

1;

