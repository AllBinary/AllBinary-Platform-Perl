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


sub isCollisionWithAvoidRectangles_j1_1 {
    my ($self, $rectangle) = @_;
    die "abstract method isCollisionWithAvoidRectangles";
}


sub isCollisionWithAvoidRectangles_j1_2 {
    my ($self, $point) = @_;
    die "abstract method isCollisionWithAvoidRectangles";
}

sub isCollisionWithAvoidRectangles {
    my ($invocant, @arguments) = @_;
    return $invocant->isCollisionWithAvoidRectangles_j1(@arguments) if scalar(@arguments) == 1;
    die "No method isCollisionWithAvoidRectangles takes " . scalar(@arguments) . " arguments";
}

sub isCollisionWithAvoidRectangles_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->isCollisionWithAvoidRectangles_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->isCollisionWithAvoidRectangles_j1_2(@arguments);
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

# use java::awt::Rectangle ();
# use java::awt::Color ();
# use java::awt::image::BufferedImage ();
use org::allbinary::graphics::GPoint ();

1;

