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
use POSIX ();

our $instance = 'org::allbinary::media::image::ImageRotationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{matrix} = 'android::graphics::Matrix'->new();
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
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


# throws Exception
sub createRotatedImage {
    my ($self, $originalImage, $rotationInDegrees) = @_;
        my $image = 'org::allbinary::media::image::ImageCreationUtil'->getInstance()->createImageWH($originalImage->getWidth(), $originalImage->getHeight());
        if ($image->isMutable()) {
            my $bitmap = ($image)->getBitmap();
            my $width = $bitmap->getWidth();
            my $height = $bitmap->getHeight();
            $self->{matrix}->setRotate($rotationInDegrees, (POSIX::floor(($width) / (2 ** (1)))), (POSIX::floor(($height) / (2 ** (1)))));
            my $canvas = ($image)->getCanvas();
            $canvas->concat($self->{matrix});
            $image->getGraphics()->drawImage($originalImage, 0, 0, $self->{anchor});
            return $image;
        } else {
            die ("Not Mutable");
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::Anchor;
use android::graphics::Bitmap;
use android::graphics::Canvas;
use android::graphics::Matrix;
use org::microemu::android::device::AndroidImageInterface;
use org::allbinary::media::image::ImageCreationUtil;

1;

