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
    $self->{gameFeatureFactory} = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
    $self->{features} = 'org::allbinary::game::configuration::feature::Features'->getInstance();
    $self->{openGLFeatureFactory} = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
    $self->{openGLUtil} = 'org::allbinary::graphics::opengles::OpenGLUtil'->getInstance();
    $self->{openGLESImageExclusionUtil} = 'org::allbinary::image::opengles::OpenGLESImageExclusionUtil'->getInstance();
    $self->{NO_COPY} = "SWT should not copy images after initial loading as the alpha is not honored";
    $self->{UNABLE} = "Unable to scale image without dimensions";
    $self->{INFORMATION} = "about_";
    $self->{LEADERBOARD} = "leaderboard";
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
        if ($self->{features}->isFeature($self->{openGLFeatureFactory}->{OPENGL})) {
            my $image = $originalImage;
            $image = $self->{openGLUtil}->addImage($image);
            return $image;
        } else {
            return $self->createImage($originalImage);
        }
}


# throws Exception
sub createImage {
    my ($self, $originalImage) = @_;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->putF($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            return $originalImage;
        }
        my $originalImage2 = $originalImage;
        if ($self->{features}->isFeature($self->{openGLFeatureFactory}->{OPENGL})) {
            if ($originalImage->getType() >= $org::allbinary::image::opengles::OpenGLESImage::TYPE) {
                my $openGLESImage = ($originalImage);
                $originalImage2 = $openGLESImage->{openGLBitmap}->getImage();
            }
        }
        my $image = undef;
        if ($originalImage2->isMutable()) {
            my $originalMutableImage = $originalImage2;
            $image = 'org::microemu::device::swt::SwtMutableImage'->new('org::microemu::app::ui::swt::SwtDeviceComponent'->createImage($originalMutableImage->{image}->getImageData()));
        } else {
            my $originalImmutableImage = $originalImage2;
            $image = 'org::microemu::device::swt::SwtMutableImage'->new('org::microemu::app::ui::swt::SwtDeviceComponent'->createImage($originalImmutableImage->{image}->getImageData()));
        }
        $image = $self->{openGLUtil}->addImage($image);
        return $image;
}


# throws Exception
sub createImageWH {
    my ($self, $originalImage, $width, $height, $mutable) = @_;
        my $originalImage2 = $originalImage;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->putF($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            return $originalImage;
        }
        if ($self->{features}->isFeature($self->{openGLFeatureFactory}->{OPENGL})) {
            if ($self->{openGLESImageExclusionUtil}->isCustomScaling($originalImage)) {
                return $self->createImage2($originalImage, $width, $height, $mutable);
            }
            if ($originalImage->getType() >= $org::allbinary::image::opengles::OpenGLESImage::TYPE) {
                my $openGLESImage = ($originalImage);
                $originalImage2 = $openGLESImage->{openGLBitmap}->getImage();
            }
        }
        my $image = undef;
        if ($originalImage2->isMutable() && $mutable) {
            my $originalMutableImage = $originalImage2;
            if (defined($originalMutableImage->getImage())) {
                my $imageData2 = $originalMutableImage->{image}->getImageData();
                my $imageData = $imageData2->scaledTo($width, $height);
                $image = 'org::microemu::device::swt::SwtMutableImage'->new('org::microemu::app::ui::swt::SwtDeviceComponent'->createImage($imageData));
            } else {
                $image = 'org::microemu::device::swt::SwtMutableImage'->new($originalMutableImage->getName(), 'org::microemu::device::swt::PostLoadSwtMutableImageProcessor'->new($originalMutableImage));
            }
        } else {
            my $originalImmutableImage = $originalImage2;
            if (defined($originalImmutableImage->getImage())) {
                my $imageData2 = $originalImmutableImage->{image}->getImageData();
                if ($width > 0 && $height > 0) {
                    my $imageData = $imageData2->scaledTo($width, $height);
                    $image = 'org::microemu::device::swt::SwtImmutableImage'->new($originalImage->getName(), 'org::microemu::app::ui::swt::SwtDeviceComponent'->createImage($imageData));
                } else {
                    $self->{logUtil}->putF($self->{UNABLE}, $self, $self->{commonStrings}->{CONSTRUCTOR});
                    $image = 'org::microemu::device::swt::SwtImmutableImage'->new($originalImmutableImage->getName(), 'org::microemu::device::swt::PostLoadSwtImmutableImageProcessor'->new($originalImmutableImage));
                }
            } else {
                $image = 'org::microemu::device::swt::SwtImmutableImage'->new($originalImmutableImage->getName(), 'org::microemu::device::swt::PostLoadSwtImmutableImageProcessor'->new($originalImmutableImage));
            }
        }
        $image = $self->{openGLUtil}->addImage($image);
        return $image;
}


# throws Exception
sub createImage2 {
    my ($self, $originalImage, $width, $height, $mutable) = @_;
        my $originalImage2 = $originalImage;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->putF($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR});
            return $originalImage;
        }
        my $image = undef;
        if ($self->{features}->isFeature($self->{openGLFeatureFactory}->{OPENGL})) {
            my $displayInfoSingleton = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
            if ($originalImage->getType() >= $org::allbinary::image::opengles::OpenGLESImage::TYPE) {
                my $openGLESImage = ($originalImage);
                my $openGLESImageProperties = $openGLESImage->{openGLESImageProperties};
                my $openGLWidth = $openGLESImage->{openGLBitmap}->getWidth();
                my $openGLHeight = $openGLESImage->{openGLBitmap}->getHeight();
                $openGLESImageProperties->{scaleX2} = (($width) / $openGLWidth);
                $openGLESImageProperties->{scaleX} = $openGLESImageProperties->{scaleX2};
                $openGLESImageProperties->{scaleY2} = (($height) / $openGLHeight);
                $openGLESImageProperties->{scaleY} = $openGLESImageProperties->{scaleY2};
                $openGLESImageProperties->{scaleX} = $openGLESImageProperties->{scaleX} * 0.75;
                $openGLESImageProperties->{scaleY} = $openGLESImageProperties->{scaleY} * 0.75;
                if ($originalImage->getHeight() % 2 != 0) {
                    $openGLESImageProperties->{scaleX2} += 1.0 / $openGLWidth;
                    $openGLESImageProperties->{scaleY2} += 1.0 / $openGLHeight;
                }
                $image = $openGLESImage;
            } else {
                $image = $originalImage;
                my $openGLESImage = $self->{openGLUtil}->addImage($image);
                my $openGLESImageProperties = $openGLESImage->{openGLESImageProperties};
                $openGLESImageProperties->{scaleX2} = (($width) / $openGLESImage->getWidth());
                $openGLESImageProperties->{scaleX} = $openGLESImageProperties->{scaleX2};
                $openGLESImageProperties->{scaleY2} = (($height) / $openGLESImage->getHeight());
                $openGLESImageProperties->{scaleY} = $openGLESImageProperties->{scaleY2};
                if ($image->getName()->startsWith($self->{INFORMATION})) {
                    $openGLESImage->{openGLESImageTranslate} = 'org::allbinary::image::opengles::OpenGLESDeviceImageTranslate'->new();
                    my $openGLESDeviceImageTranslate = $openGLESImage->{openGLESImageTranslate};
                    $openGLESDeviceImageTranslate->{translateX} = $displayInfoSingleton->getLastWidth() / 1.4 / $openGLESImageProperties->{scaleX};
                    $openGLESDeviceImageTranslate->{translateY} = $displayInfoSingleton->getLastHeight() / 4 / $openGLESImageProperties->{scaleY};
                    $openGLESImageProperties->{scaleX} = $openGLESImageProperties->{scaleX} * 0.25;
                    $openGLESImageProperties->{scaleY} = $openGLESImageProperties->{scaleY} * 0.25;
                } else {
                    $openGLESImageProperties->{scaleX} = $openGLESImageProperties->{scaleX} * 0.75;
                    $openGLESImageProperties->{scaleY} = $openGLESImageProperties->{scaleY} * 0.75;
                    if ($image->getName()->startsWith($self->{LEADERBOARD})) {
                        $openGLESImage->{openGLESImageTranslate} = 'org::allbinary::image::opengles::OpenGLESDeviceImageTranslate'->new();
                        my $openGLESDeviceImageTranslate = $openGLESImage->{openGLESImageTranslate};
                        $openGLESDeviceImageTranslate->{translateX} = -$displayInfoSingleton->getLastWidth() / 40 / $openGLESImageProperties->{scaleX};
                    }
                    if ($image->getName()->startsWith($self->{LEADERBOARD})) {
                    } else {
                        $openGLESImageProperties->{scaleX} = 1.0;
                        $openGLESImageProperties->{scaleY} = 1.0;
                    }
                }
                $image = $openGLESImage;
            }
        } else {
            if ($originalImage2->isMutable() && $mutable) {
                my $originalMutableImage = $originalImage2;
                if (defined($originalMutableImage->getImage())) {
                    my $imageData2 = $originalMutableImage->{image}->getImageData();
                    my $imageData = $imageData2->scaledTo($width, $height);
                    $image = 'org::microemu::device::swt::SwtMutableImage'->new('org::microemu::app::ui::swt::SwtDeviceComponent'->createImage($imageData));
                } else {
                    $image = 'org::microemu::device::swt::SwtMutableImage'->new($originalMutableImage->getName(), 'org::microemu::device::swt::PostLoadSwtMutableImageProcessor'->new($originalMutableImage));
                }
            } else {
                my $originalImmutableImage = $originalImage2;
                if (defined($originalImmutableImage->getImage())) {
                    my $imageData2 = $originalImmutableImage->{image}->getImageData();
                    my $imageData = $imageData2->scaledTo($width, $height);
                    $image = 'org::microemu::device::swt::SwtImmutableImage'->new($originalImage->getName(), 'org::microemu::app::ui::swt::SwtDeviceComponent'->createImage($imageData));
                } else {
                    $image = 'org::microemu::device::swt::SwtImmutableImage'->new($originalImmutableImage->getName(), 'org::microemu::device::swt::PostLoadSwtImmutableImageProcessor'->new($originalImmutableImage));
                }
            }
            $image = $self->{openGLUtil}->addImage($image);
        }
        return $image;
}


# throws Exception
sub createImageScale {
    my ($self, $originalImage, $canvasScale, $resize) = @_;
        if (!$self->{features}->isFeature($self->{gameFeatureFactory}->{POST_IMAGE_LOADING_MODIFICATION})) {
            $self->{logUtil}->putF($self->{NO_COPY}, $self, $self->{commonStrings}->{CONSTRUCTOR});
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
        my $image = $self->createImageWH($originalImage, $newWidth, $newHeight, 1);
        if ($image->isMutable()) {
            my $originalImageData = ($originalImage->getImage())->getImageData();
            my $mutableImage2 = $image;
            my $halfWidthDelta = ($newWidth - $originalImage->getWidth()) / 2;
            my $halfHeightDelta = ($newHeight - $originalImage->getHeight()) / 2;
            my $originalPixelArray = [(0) x ($originalImage->getWidth() * $originalImage->getHeight())];
            my $newPixelArray = [(0) x ($image->getWidth() * $image->getHeight())];
            my $width = $originalImage->getWidth();
            my $height = $originalImage->getHeight();
            for (my $i = 0; $i < $height; $i++) {
                $originalImageData->getPixels(0, $i, $width, $originalPixelArray, ($i * $width));
            }
            for (my $index = $halfWidthDelta; $index < $width; $index++) {
                for (my $index2 = $halfHeightDelta; $index2 < $height; $index2++) {
                    $newPixelArray->[$index + ($index2 * $width)] = $originalPixelArray->[($index - $halfWidthDelta) + (($index2 - $halfHeightDelta) * $width)];
                }
            }
            ($mutableImage2->getImage())->getImageData()->setPixels(0, 0, $image->getWidth(), $newPixelArray, 0);
            return $image;
        } else {
            my $originalImmutableImage = $image;
            my $originalImageData = ($originalImage->getImage())->getImageData();
            my $halfWidthDelta = ($newWidth - $originalImage->getWidth()) / 2;
            my $halfHeightDelta = ($newHeight - $originalImage->getHeight()) / 2;
            my $originalPixelArray = [(0) x ($originalImage->getWidth() * $originalImage->getHeight())];
            my $newPixelArray = [(0) x ($image->getWidth() * $image->getHeight())];
            my $width = $originalImage->getWidth();
            my $height = $originalImage->getHeight();
            for (my $i = 0; $i < $height; $i++) {
                $originalImageData->getPixels(0, $i, $width, $originalPixelArray, ($i * $width));
            }
            for (my $index = $halfWidthDelta; $index < $width; $index++) {
                for (my $index2 = $halfHeightDelta; $index2 < $height; $index2++) {
                    $newPixelArray->[$index + ($index2 * $width)] = $originalPixelArray->[($index - $halfWidthDelta) + (($index2 - $halfHeightDelta) * $width)];
                }
            }
            ($originalImmutableImage->getImage())->getImageData()->setPixels(0, 0, $image->getWidth(), $newPixelArray, 0);
            return $image;
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::graphics::opengles::OpenGLUtil;
use org::allbinary::image::opengles::OpenGLESDeviceImageTranslate;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::image::opengles::OpenGLESImageExclusionUtil;
use org::allbinary::image::opengles::OpenGLESImageProperties;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::eclipse::swt::graphics::ImageData;
use org::microemu::app::ui::swt::SwtDeviceComponent;
use org::microemu::device::swt::PostLoadSwtImmutableImageProcessor;
use org::microemu::device::swt::PostLoadSwtMutableImageProcessor;
use org::microemu::device::swt::SwtImmutableImage;
use org::microemu::device::swt::SwtMutableImage;

1;

