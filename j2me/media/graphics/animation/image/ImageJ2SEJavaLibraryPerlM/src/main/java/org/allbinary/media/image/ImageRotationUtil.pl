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

package org::allbinary::media::image::ImageRotationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageRotationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{imageJ2SERotationUtil} = 'org::allbinary::media::image::ImageJ2SERotationUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageRotationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub rotateImage {
    my ($self, $originalImage, $image, $totalAngle) = @_;
        if ($image->isMutable()) {
            my $j2seImage = $image;
            my $newBufferedImage = $j2seImage->getImage();
            my $originalAwtImage = undef;
            if ($originalImage->isMutable()) {
                my $originalJ2SEImage = $originalImage;
                $originalAwtImage = $originalJ2SEImage->getImage();
            } else {
                my $originalJ2SEImage = $originalImage;
                $originalAwtImage = $originalJ2SEImage->getImage();
            }
            $self->{imageJ2SERotationUtil}->rotateImage($originalAwtImage, $newBufferedImage, $totalAngle);
        } else {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("Not Mutable", $self, "getRotatedImage", ("Exception"));
        }
}


# throws Exception
sub createRotatedImage {
    my ($self, $originalImage, $rotationInDegrees) = @_;
        my $image = 'org::allbinary::media::image::ImageCreationUtil'->getInstance()->createImageWH($originalImage->getWidth(), $originalImage->getHeight());
        if ($image->isMutable()) {
            my $originalAwtImage = undef;
            if ($originalImage->isMutable()) {
                my $originalJ2SEImage = $originalImage;
                $originalAwtImage = $originalJ2SEImage->getImage();
            } else {
                my $originalJ2SEImage = $originalImage;
                $originalAwtImage = $originalJ2SEImage->getImage();
            }
            my $j2seImage = $image;
            my $newBufferedImage = $j2seImage->getImage();
            my $bufferedImage = $self->{imageJ2SERotationUtil}->createRotatedImage($originalAwtImage, $newBufferedImage, $rotationInDegrees);
            return $image;
        } else {
            die ("Not Mutable");
        }
}

# use java::awt::image::BufferedImage;
# use javax::microedition::lcdui::Image;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::microemu::device::j2se::J2SEImmutableImage;
use org::microemu::device::j2se::J2SEMutableImage;
use org::allbinary::media::image::ImageJ2SERotationUtil;
use org::allbinary::media::image::ImageCreationUtil;

1;

