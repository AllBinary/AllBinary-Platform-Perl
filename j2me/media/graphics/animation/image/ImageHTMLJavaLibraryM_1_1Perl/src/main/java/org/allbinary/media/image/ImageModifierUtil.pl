# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::media::image::ImageModifierUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{resourceCallbackStrings} = 'org::microemu::device::ResourceCallbackStrings'->getInstance();
    $self->{alphaArray} = undef;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstanceOrCreate {
    my ($class) = @_;
        return 'org::allbinary::media::image::ImageModifierUtil'->new();
}


sub setColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
}


sub changeColor {
    my ($self, $unusedOriginalImage, $image, $imageIndex, $basicColor) = @_;
}


sub setAlpha {
    my ($self, $originalImage, $image, $imageIndex, $alpha) = @_;
        my $alphaF = $alpha;
        my $alphaFloat = $alphaF / 255.0;
        $self->setAlphaF($originalImage, $image, $imageIndex, $alphaFloat);
}


sub setAlphaF {
    my ($self, $originalImage, $image, $imageIndex, $alpha) = @_;
        if ($self->{alphaArray}->[$imageIndex]) {
            $self->{alphaArray}->[$imageIndex] = 0;
            $self->setAlpha2($originalImage, $image, $imageIndex, $alpha);
        }
}


sub setAlpha2 {
    my ($self, $originalImage, $image, $imageIndex, $alpha) = @_;
        my $htmlImage = $image;
        my $canvasImage = $htmlImage->getImage();
        my $originalPlaynImage = ($originalImage)->getImage();
        my $canvas = $canvasImage->canvas();
        $canvas->clear();
        $canvas->setAlpha($alpha);
        $canvas->drawImage($originalPlaynImage, 0, 0);
}


sub setAlpha3 {
    my ($self, $image, $alpha) = @_;
        my $alphaF = $alpha;
        my $alphaFloat = $alphaF / 255.0;
        my $htmlImage = $image;
        my $canvasImage = $htmlImage->getImage();
        my $canvas = $canvasImage->canvas();
        $canvas->setAlpha($alphaFloat);
}


sub getImageArray {
    my ($self, $originalImageArray) = @_;
        my $size = scalar(@{$originalImageArray});
        $self->{alphaArray} = [(0) x ($size)];
        my $imageArray = [(undef) x ($size)];
        for (my $index = 0; $index < $size; $index++) {
            $imageArray->[$index] = $originalImageArray->[$index];
            $self->handleImage($imageArray, $index, $originalImageArray->[$index]);
        }
        return $imageArray;
}


sub handleImage {
    my ($self, $imageArray, $index, $image) = @_;
        my $image3 = ($image)->getImage();
        if (defined($image3)) {
            if ($image3->isReady() || $image3->width() + $image3->height() <= 0 || $image->getName() eq $self->{resourceCallbackStrings}->{FROM_DATA}) {
                $self->copy($imageArray, $index, $image, $image3);
            } else {
                my $callback = do {
                    package playn::core::util::Callback::AnonymousN68494 { our @ISA = ('playn::core::util::Callback');
                    

                    sub onSuccess {
                        my ($self, $resource) = @_;
                        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                        $logUtil->putF($self->{resourceCallbackStrings}->{DONE} . $image->getName(), $self, $self->{resourceCallbackStrings}->{HANDLE_IMAGE});
                        $self->copy($imageArray, $index, $image, $image3);
                    }
                    

                    sub onFailure {
                        my ($self, $e) = @_;
                        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                        $logUtil->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{EXCEPTION_LABEL})->append($self->{resourceCallbackStrings}->{ERROR})->append($image->getName())->toString(), $self, $self->{resourceCallbackStrings}->{HANDLE_IMAGE});
                    }
                    }
                    'playn::core::util::Callback::AnonymousN68494'->can('new') ? 'playn::core::util::Callback::AnonymousN68494'->new() : bless({}, 'playn::core::util::Callback::AnonymousN68494')
                };
                $image3->addCallback($callback);
            }
        } else {
            $self->{logUtil}->putF($self->{resourceCallbackStrings}->{NULL} + $image->isMutable(), $self, $self->{resourceCallbackStrings}->{HANDLE_IMAGE});
        }
}


sub copy {
    my ($self, $imageArray, $index, $image, $image3) = @_;
        try {
            my $image2 = 'javax::microedition::lcdui::Image'->createImage($image3->width(), $image3->height());
            my $graphics = $image2->getGraphics();
            $graphics->drawImage($image, 0, 0, $org::allbinary::graphics::Anchor::TOP_LEFT);
            $imageArray->[$index] = $image2;
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION_LABEL} + $self->{resourceCallbackStrings}->{DONE}, $self, $self->{resourceCallbackStrings}->{HANDLE_IMAGE});
        }
}


sub reset {
    my ($self) = @_;
        my $size = scalar(@{$self->{alphaArray}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{alphaArray}->[$index] = 1;
        }
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::microemu::device::playn::PlaynImage;
use org::microemu::device::ResourceCallbackStrings;
use playn::core::Canvas;
use playn::core::CanvasImage;
use playn::core::util::Callback;

1;

