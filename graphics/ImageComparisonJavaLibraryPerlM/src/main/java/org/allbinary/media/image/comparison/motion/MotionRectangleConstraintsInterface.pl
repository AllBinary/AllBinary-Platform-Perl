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
package org::allbinary::media::image::comparison::motion::MotionRectangleConstraintsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getMaxMotionRectangles {
    my ($self) = @_;
    die "abstract method getMaxMotionRectangles";
}


sub getMinDimension {
    my ($self) = @_;
    die "abstract method getMinDimension";
}


sub getMinArea {
    my ($self) = @_;
    die "abstract method getMinArea";
}


sub getMaxDimension {
    my ($self) = @_;
    die "abstract method getMaxDimension";
}


sub isTooSmall {
    my ($self, $rectangle) = @_;
    die "abstract method isTooSmall";
}


sub isAreaTooSmall {
    my ($self, $rectangle) = @_;
    die "abstract method isAreaTooSmall";
}


sub isTooBig {
    my ($self, $rectangle) = @_;
    die "abstract method isTooBig";
}


# throws Exception
sub isValid {
    my ($self, $frame, $bufferedImage, $rectangle) = @_;
    die "abstract method isValid";
}

# use java::awt;
# use java::awt::image::BufferedImage;

1;

