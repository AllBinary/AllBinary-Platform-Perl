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

package org::allbinary::media::image::ImageCopyUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageCopyUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{imageCreationUtil} = 'org::allbinary::media::image::ImageCreationUtil'->getInstance();
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{gameFeatureFactory} = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
    $self->{features} = 'org::allbinary::game::configuration::feature::Features'->getInstance();
    $self->{NO_COPY} = "J2ME does not need to copy images after initial loading";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageCopyUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub createImageForRotation {
    my ($self, $originalImage) = @_;
        return $self->createImage($originalImage);
}


# throws Exception
sub createImage {
    my ($self, $originalImage) = @_;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->put($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR}, ("Exception"));
            return $originalImage;
        }
        my $image = $self->{imageCreationUtil}->createImageWH($originalImage->getWidth(), $originalImage->getHeight());
        if ($image->isMutable()) {
            $image->getGraphics()->drawImage($originalImage, 0, 0, $self->{anchor});
            return $image;
        } else {
            die ("Not Mutable");
        }
}


# throws Exception
sub createImageScale {
    my ($self, $originalImage, $canvasScale, $resize) = @_;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->put($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR}, ("Exception"));
            return $originalImage;
        }
        my $newWidth = int(($originalImage->getWidth() * $canvasScale));
        my $newHeight = int(($originalImage->getHeight() * $canvasScale));
        if ($resize) {
            if ($newWidth < $newHeight) {
                $newWidth = $newHeight;
            }
            if ($newHeight < $newWidth) {
                $newHeight = $newWidth;
            }
        }
        my $image = $self->{imageCreationUtil}->createImageWH($newWidth, $newHeight);
        if ($image->isMutable()) {
            my $halfWidthDelta = ($newWidth - $originalImage->getWidth()) / 2;
            my $halfHeightDelta = ($newHeight - $originalImage->getHeight()) / 2;
            my $graphics = $image->getGraphics();
            $graphics->drawImage($originalImage, $halfWidthDelta, $halfHeightDelta, $self->{anchor});
            return $image;
        } else {
            die ("Not Mutable");
        }
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::graphics::Anchor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::ImageCreationUtil;

1;

