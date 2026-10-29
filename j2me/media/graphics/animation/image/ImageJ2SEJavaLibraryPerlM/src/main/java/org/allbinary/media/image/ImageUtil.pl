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

package org::allbinary::media::image::ImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{IIOIMAGE_POOL_NAME} = "IIOIMAGE_POOL_NAME";
    $self->{CREATE_BUFFERED_IMAGE} = "createBufferedImage";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getDefaultConfiguration {
    my ($self) = @_;
        my $ge = 'java::awt::GraphicsEnvironment'->getLocalGraphicsEnvironment();
        my $gd = $ge->getDefaultScreenDevice();
        return $gd->getDefaultConfiguration();
}


sub create {
    my ($self, $width, $height) = @_;
        my $graphicsConfiguration = $self->getDefaultConfiguration();
        return $graphicsConfiguration->createCompatibleImage($width, $height, $java::awt::Transparency::TRANSLUCENT);
}


# throws Exception
sub createBufferedImageForResize {
    my ($self, $bufferedImageArray, $percent, $scale) = @_;
        my $size = scalar(@{$bufferedImageArray});
        my $scaledBufferedImageArray = [(undef) x ($size)];
        my $bufferedImage = undef;
        for (my $index = 0; $index < $size; $index++) {
            $bufferedImage = $bufferedImageArray->[$index];
            my $newWidth = int(($bufferedImage->getWidth() * $percent / 100));
            my $newHeight = int(($bufferedImage->getHeight() * $percent / 100));
            $scaledBufferedImageArray->[$index] = $self->createBufferedImage($bufferedImage, $newWidth, $newHeight, $scale);
        }
        return $scaledBufferedImageArray;
}


# throws Exception
sub createBufferedImage2 {
    my ($self, $bufferedImageArray, $percent, $scale) = @_;
        my $size = scalar(@{$bufferedImageArray});
        my $scaledBufferedImageArray = [(undef) x ($size)];
        my $bufferedImage = undef;
        for (my $index = 0; $index < $size; $index++) {
            $bufferedImage = $bufferedImageArray->[$index];
            my $newWidth = int(($bufferedImage->getWidth() * $percent));
            my $newHeight = int(($bufferedImage->getHeight() * $percent));
            $scaledBufferedImageArray->[$index] = $self->createBufferedImage($bufferedImage, $newWidth, $newHeight, $scale);
        }
        return $scaledBufferedImageArray;
}


# throws Exception
sub createBufferedImage3 {
    my ($self, $bufferedImageArray, $width, $height, $scale) = @_;
        my $size = scalar(@{$bufferedImageArray});
        my $scaledBufferedImageArray = [(undef) x ($size)];
        for (my $index = 0; $index < $size; $index++) {
            $scaledBufferedImageArray->[$index] = $self->createBufferedImage($bufferedImageArray->[$index], $width, $height, $scale);
        }
        return $scaledBufferedImageArray;
}


# throws Exception
sub createBufferedImageForSave {
    my ($self, $bufferedImage, $newWidth, $newHeight) = @_;
        return $self->createBufferedImage($bufferedImage, $newWidth, $newHeight, 1);
}


# throws Exception
sub createBufferedImage {
    my ($self, $bufferedImage, $newWidth, $newHeight, $scale) = @_;
        return $self->createBufferedImageAllowTranslate($bufferedImage, $newWidth, $newHeight, $scale, 0);
}


# throws Exception
sub createBufferedImageAllowTranslate {
    my ($self, $bufferedImage, $newWidth, $newHeight, $scale, $allowTranslate) = @_;
        my $width = $bufferedImage->getWidth();
        my $height = $bufferedImage->getHeight();
        my $d_newWidth = $newWidth;
        my $d_newHeight = $newHeight;
        my $widthRatio = $d_newWidth / $width;
        my $heightRatio = $d_newHeight / $height;
        my $ratioX = 1.0;
        my $ratioY = 1.0;
        if ($scale) {
            $ratioX = $widthRatio;
            $ratioY = $heightRatio;
        }
        my $affineTransform = 'java::awt::geom::AffineTransform'->getScaleInstance($ratioX, $ratioY);
        if (!$scale && $allowTranslate) {
            my $dx = ($newWidth - $width) / 2.0;
            my $dy = ($newHeight - $height) / 2.0;
            $affineTransform->translate($dx, $dy);
        }
        my $newBufferedImage = 'java::awt::image::BufferedImage'->new($newWidth, $newHeight, $java::awt::image::BufferedImage::TYPE_INT_ARGB_PRE);
        my $graphics = $newBufferedImage->createGraphics();
        $graphics->drawRenderedImage($bufferedImage, $affineTransform);
        return $newBufferedImage;
}


# throws Exception
sub createBufferedImageWithLargerCanvas {
    my ($self, $bufferedImage, $newWidth, $newHeight) = @_;
        my $width = $bufferedImage->getWidth();
        my $height = $bufferedImage->getHeight();
        my $d_newWidth = $newWidth;
        my $d_newHeight = $newHeight;
        my $widthRatio = $d_newWidth / $width;
        my $heightRatio = $d_newHeight / $height;
        my $dx2 = int(($newWidth - $width));
        my $dy2 = int(($newHeight - $height));
        my $dx = int($dx2 / 2);
        my $dy = int($dy2 / 2);
        my $dx4 = int($dx2 / 4);
        my $dy4 = int($dy2 / 4);
        my $newBufferedImage = 'java::awt::image::BufferedImage'->new($newWidth, $newHeight, $java::awt::image::BufferedImage::TYPE_INT_ARGB_PRE);
        my $graphics = $newBufferedImage->createGraphics();
        $graphics->drawImage($bufferedImage, $dx4, $dy4, undef);
        return $newBufferedImage;
}


sub convertToBufferedImage {
    my ($self, $toolkitImage) = @_;
        if (!defined($toolkitImage)) {
            return undef;
        }
        my $bufferedImage = 'java::awt::image::BufferedImage'->new($toolkitImage->getWidth(undef), $toolkitImage->getHeight(undef), $java::awt::image::BufferedImage::TYPE_INT_ARGB);
        my $g2d = $bufferedImage->createGraphics();
        $g2d->drawImage($toolkitImage, 0, 0, undef);
        $g2d->dispose();
        return $bufferedImage;
}


sub getBufferedImage {
    my ($self, $image) = @_;
        my $bufferedImage = undef;
        if ($image->isMutable()) {
            my $j2seImage = $image;
            $bufferedImage = $j2seImage->getImage();
        } else {
            my $j2seImage = $image;
            $bufferedImage = $j2seImage->getImage();
        }
        return $bufferedImage;
}


sub toString {
    my ($self, $bufferedImage) = @_;
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(" BufferedImage -");
        $stringBuffer->append($commonLabels->{WIDTH_LABEL});
        $stringBuffer->appendint(int($bufferedImage->getWidth()));
        $stringBuffer->append($commonLabels->{HEIGHT_LABEL});
        $stringBuffer->appendint(int($bufferedImage->getHeight()));
        $stringBuffer->append(" Type: ");
        $stringBuffer->appendint(int($bufferedImage->getType()));
        return $stringBuffer->toString();
}

# use java::awt::Graphics2D;
# use java::awt::GraphicsConfiguration;
# use java::awt::GraphicsDevice;
# use java::awt::GraphicsEnvironment;
# use java::awt::Transparency;
# use java::awt::geom::AffineTransform;
# use java::awt::image::BufferedImage;
# use javax::microedition::lcdui::Image;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::microemu::device::j2se::J2SEImmutableImage;
use org::microemu::device::j2se::J2SEMutableImage;

1;

