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

package org::allbinary::media::image::ImageCreationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageCreationUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageCreationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub createImageWH {
    my ($self, $width, $height) = @_;
        my $image = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->get(ref($self), $width, $height);
        return $image;
}


# throws Exception
sub createImage {
    my ($self, $width, $height, $maxScaleX, $maxScaleY) = @_;
        my $image = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->get(ref($self), int(($width * $maxScaleX)) + 1, int(($height * $maxScaleY)) + 1);
        return $image;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::image::GameFeatureImageCacheFactory;

1;

