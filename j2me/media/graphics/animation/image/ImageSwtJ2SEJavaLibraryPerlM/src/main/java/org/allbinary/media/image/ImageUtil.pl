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
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
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
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub create {
    my ($self, $width, $height) = @_;
        my $display = $org::microemu::app::BareMain::shell->getDisplay();
        return 'org::eclipse::swt::graphics::Image'->new($display, $width, $height);
}


# throws Exception
sub createBufferedImage {
    my ($self, $bufferedImageArray, $percent, $scale) = @_;
        my $size = scalar(@{$bufferedImageArray});
        my $scaledBufferedImageArray = [(undef) x ($size)];
        my $bufferedImage = undef;
        my $imageData = undef;
        for (my $index = 0; $index < $size; $index++) {
            $bufferedImage = $bufferedImageArray->[$index];
            $imageData = $bufferedImage->getImageData();
            my $newWidth = int(($imageData->{width} * $percent / 100));
            my $newHeight = int(($imageData->{height} * $percent / 100));
            $scaledBufferedImageArray->[$index] = $self->createBufferedImage5($bufferedImage, $newWidth, $newHeight, $scale);
        }
        return $scaledBufferedImageArray;
}


# throws Exception
sub createBufferedImage2 {
    my ($self, $bufferedImageArray, $percent, $scale) = @_;
        my $size = scalar(@{$bufferedImageArray});
        my $scaledBufferedImageArray = [(undef) x ($size)];
        my $bufferedImage = undef;
        my $imageData = undef;
        for (my $index = 0; $index < $size; $index++) {
            $bufferedImage = $bufferedImageArray->[$index];
            $imageData = $bufferedImage->getImageData();
            my $newWidth = int(($imageData->{width} * $percent));
            my $newHeight = int(($imageData->{height} * $percent));
            $scaledBufferedImageArray->[$index] = $self->createBufferedImage5($bufferedImage, $newWidth, $newHeight, $scale);
        }
        return $scaledBufferedImageArray;
}


# throws Exception
sub createBufferedImage3 {
    my ($self, $bufferedImageArray, $width, $height, $scale) = @_;
        my $size = scalar(@{$bufferedImageArray});
        my $scaledBufferedImageArray = [(undef) x ($size)];
        for (my $index = 0; $index < $size; $index++) {
            $scaledBufferedImageArray->[$index] = $self->createBufferedImage5($bufferedImageArray->[$index], $width, $height, $scale);
        }
        return $scaledBufferedImageArray;
}


# throws Exception
sub createBufferedImage4 {
    my ($self, $bufferedImage, $newWidth, $newHeight) = @_;
        return $self->createBufferedImage5($bufferedImage, $newWidth, $newHeight, 1);
}


# throws Exception
sub createBufferedImage5 {
    my ($self, $bufferedImage, $newWidth, $newHeight, $scale) = @_;
        return $self->createBufferedImage6($bufferedImage, $newWidth, $newHeight, $scale, 0);
}


# throws Exception
sub createBufferedImage6 {
    my ($self, $bufferedImage, $newWidth, $newHeight, $scale, $allowTranslate) = @_;
        my $imageData = $bufferedImage->getImageData();
        my $width = $imageData->{width};
        my $height = $imageData->{height};
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
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->appendfloat($width)->append($self->{commonSeps}->{FORWARD_SLASH})->appendfloat($height)->append($self->{commonSeps}->{COLON})->appendint($newWidth)->append($self->{commonSeps}->{FORWARD_SLASH})->appendint($newHeight)->append($self->{commonSeps}->{COLON})->appendfloat($widthRatio)->append($self->{commonSeps}->{FORWARD_SLASH})->appendfloat($heightRatio)->toString(), $self, $self->{CREATE_BUFFERED_IMAGE});
        my $dx = 0.0;
        my $dy = 0.0;
        if (!$scale && $allowTranslate) {
            $dx = ($newWidth - $width) / 2.0;
            $dy = ($newHeight - $height) / 2.0;
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Translate dx: ")->appendfloat($dx)->append(" dy: ")->appendfloat($dy)->toString(), $self, $self->{CREATE_BUFFERED_IMAGE});
        }
        my $newBufferedImage = 'org::eclipse::swt::graphics::Image'->new($org::microemu::app::BareMain::shell->getDisplay(), $newWidth, $newHeight);
        my $gc = 'org::eclipse::swt::graphics::GC'->new($newBufferedImage);
        my $affineTransform = 'org::eclipse::swt::graphics::Transform'->new($gc->getDevice());
        $affineTransform->scale($ratioX, $ratioY);
        $affineTransform->translate($dx, $dy);
        $gc->setTransform($affineTransform);
        $gc->setAntialias($org::eclipse::swt::SWT::ON);
        $gc->setInterpolation($org::eclipse::swt::SWT::HIGH);
        $gc->drawImage($bufferedImage, 0, 0, $bufferedImage->getBounds()->{width}, $bufferedImage->getBounds()->{height}, 0, 0, $newWidth, $newHeight);
        $gc->dispose();
        return $newBufferedImage;
}


sub drawTransformedImage {
    my ($self, $image, $parent, $dx, $dy, $width, $height) = @_;
        my $imageCanvas = 'org::eclipse::swt::widgets::Canvas'->new($parent, $org::eclipse::swt::SWT::NONE);
        $imageCanvas->addPaintListener(do {
            package org::eclipse::swt::events::PaintListener::AnonymousN71455 { our @ISA = ('org::eclipse::swt::events::PaintListener');
            

            sub paintControl {
                my ($self, $event) = @_;
                my $gc = $event->{gc};
                my $affineTransform = 'org::eclipse::swt::graphics::Transform'->new($gc->getDevice());
                $affineTransform->translate($dx, $dy);
                $gc->setAntialias($org::eclipse::swt::SWT::ON);
                $gc->setInterpolation($org::eclipse::swt::SWT::HIGH);
                $gc->drawImage($image, 0, 0, $image->getBounds()->{width}, $image->getBounds()->{height}, 0, 0, $width, $height);
            }
            }
            'org::eclipse::swt::events::PaintListener::AnonymousN71455'->can('new') ? 'org::eclipse::swt::events::PaintListener::AnonymousN71455'->new() : bless({}, 'org::eclipse::swt::events::PaintListener::AnonymousN71455')
        });
        return $imageCanvas;
}


sub toString {
    my ($self, $bufferedImage) = @_;
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $imageData = $bufferedImage->getImageData();
        $stringBuffer->append(" org.eclipse.swt.graphics.Image: ");
        $stringBuffer->append($commonLabels->{WIDTH_LABEL});
        $stringBuffer->appendint(int($imageData->{width}));
        $stringBuffer->append($commonLabels->{HEIGHT_LABEL});
        $stringBuffer->appendint(int($imageData->{height}));
        $stringBuffer->append(" Type: ");
        $stringBuffer->appendint(int($imageData->{type}));
        return $stringBuffer->toString();
}

use org::eclipse::swt::SWT;
use org::eclipse::swt::widgets::Canvas;
use org::eclipse::swt::widgets::Composite;
use org::eclipse::swt::graphics::GC;
use org::eclipse::swt::graphics::ImageData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::eclipse::swt::events::PaintEvent;
use org::eclipse::swt::events::PaintListener;
use org::eclipse::swt::graphics::Transform;
use org::eclipse::swt::widgets::Display;
use org::microemu::app::BareMain;

1;

