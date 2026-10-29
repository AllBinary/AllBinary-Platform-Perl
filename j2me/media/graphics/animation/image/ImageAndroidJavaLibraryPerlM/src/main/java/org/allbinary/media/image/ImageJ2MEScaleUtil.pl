#
# AllBinary Open License Version 1
# Copyright (c) 2023 AllBinary
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

package org::allbinary::media::image::ImageJ2MEScaleUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageJ2MEScaleUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageJ2MEScaleUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub scaleArray {
    my ($self, $images, $width, $height) = @_;
        for (my $index = 0; $index < scalar(@{$images}); $index++) {
            my $image = $images->[$index];
            $images->[$index] = 'org::allbinary::media::image::ImageScaleUtil'->getInstance()->createImage2('org::allbinary::image::GameFeatureImageCacheFactory'->getInstance(), $image, $width / 2.0, $image->getWidth(), $height, $image->getHeight(), 0);
        }
        return $images;
}


# throws Exception
sub scale {
    my ($self, $image, $width, $height) = @_;
        return 'org::allbinary::media::image::ImageScaleUtil'->getInstance()->createImage2('org::allbinary::image::GameFeatureImageCacheFactory'->getInstance(), $image, $width, $image->getWidth(), $height, $image->getHeight(), 0);
}

# use javax::microedition::lcdui::Image;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::media::image::ImageScaleUtil;

1;

