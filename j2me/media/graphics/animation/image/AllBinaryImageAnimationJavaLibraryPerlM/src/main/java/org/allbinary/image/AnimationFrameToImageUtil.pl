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

package org::allbinary::image::AnimationFrameToImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::image::AnimationFrameToImageUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::AnimationFrameToImageUtil::instance;
}


# throws Exception
sub getInstanceTranslate {
    my ($self, $width, $height, $animationInterface) = @_;
        my $image = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->get(ref($org::allbinary::image::AnimationFrameToImageUtil::instance), (POSIX::floor((($width * 3)) / (2 ** (1)))), (POSIX::floor((($height * 3)) / (2 ** (1)))));
        my $graphics = $image->getGraphics();
        my $tranlateX = (POSIX::floor(($width) / (2 ** (2))));
        my $tranlateY = (POSIX::floor(($height) / (2 ** (2))));
        $graphics->translate($tranlateX, $tranlateY);
        $animationInterface->paintXY($graphics, 0, 0);
        $graphics->translate(-$tranlateX, -$tranlateY);
        return $image;
}


# throws Exception
sub getInstanceWH {
    my ($self, $width, $height, $animationInterface) = @_;
        my $image = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->get(ref($org::allbinary::image::AnimationFrameToImageUtil::instance), $width, $height);
        my $graphics = $image->getGraphics();
        $animationInterface->paintXY($graphics, 0, 0);
        return $image;
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::image::GameFeatureImageCacheFactory;

1;

