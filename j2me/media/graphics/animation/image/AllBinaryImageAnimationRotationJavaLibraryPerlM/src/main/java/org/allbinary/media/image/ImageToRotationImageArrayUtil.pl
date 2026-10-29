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

package org::allbinary::media::image::ImageToRotationImageArrayUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageToRotationImageArrayUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageToRotationImageArrayUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub generate {
    my ($self, $image, $angleIncrement, $totalAngle) = @_;
        my $imageRotationUtil = 'org::allbinary::media::image::ImageRotationUtil'->getInstance();
        my $totalFrames = int($totalAngle / $angleIncrement);
        my $imageArray = [(undef) x ($totalFrames)];
        $imageArray->[0] = $image;
        for (my $index = 1; $index < $totalFrames; $index++) {
            $imageArray->[$index] = $imageRotationUtil->createRotatedImage($image, $index * $angleIncrement);
        }
        return $imageArray;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::media::image::ImageRotationUtil;

1;

