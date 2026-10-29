# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

#PlatformNullImageJavaLibrary
package javax::microedition::lcdui::PlatformImage;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getImage {
    my ($self, $graphicsSurface2) = @_;
        return $javax::microedition::lcdui::NullImage::NULL_IMAGE;
}


sub getSurfaceWidth {
    my ($self, $graphicsSurface2, $width) = @_;
        return $width;
}


sub getSurfaceHeight {
    my ($self, $graphicsSurface2, $height) = @_;
        return $height;
}


sub getWidth {
    my ($self, $image, $width) = @_;
        return $width;
}


sub getHeight {
    my ($self, $image, $height) = @_;
        return $height;
}


sub getGraphics {
    my ($self, $graphicsSurface, $width, $height, $image) = @_;
        die ("RuntimeException");
}


sub drawImage {
    my ($self, $image, $x, $y, $anchor, $g2, $g) = @_;
}


sub drawRegion {
    my ($self, $image, $x_src, $y_src, $width, $height, $transform, $x_dst, $y_dst, $anchor, $g) = @_;
}


sub getRGB {
    my ($self, $argb, $offset, $scanlength, $x, $y, $width, $height, $image) = @_;
}


sub setRGB {
    my ($self, $argb, $offset, $scanlength, $x, $y, $width, $height, $image) = @_;
}


sub getData {
    my ($self, $image) = @_;
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
}

use org::allbinary::logic::NullUtil;
use javax::microedition::lcdui::NullImage;

1;

