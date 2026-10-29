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

package org::allbinary::image::PaintableToImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::PaintableToImageUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getImage {
    my ($class, $paintableInterface, $width, $height) = @_;
        my $image = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->get(ref($org::allbinary::image::PaintableToImageUtil::instance), $width, $height);
        my $graphics = $image->getGraphics();
        $paintableInterface->paint($graphics);
        return $image;
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::image::GameFeatureImageCacheFactory;

1;

