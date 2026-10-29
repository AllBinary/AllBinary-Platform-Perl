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

package org::allbinary::media::image::comparison::ImageComparisonResult;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{bufferedImages} = [(undef) x (2)];
    $self->{name} = undef;
    $self->{isSameHeight} = 0;
    $self->{isSameWidth} = 0;
    $self->{imageHeight} = undef;
    $self->{imageWidth} = undef;
    $self->{nonMatchingPixelVector} = undef;
    $self->{frameOne} = undef;
    $self->{frameTwo} = undef;
    $self->{pixelsThatMatch} = 0;
    $self->{pixelsIgnored} = 0;
    $self->{tolerance} = 0;
    $self->{matchingPercent} = -1;
}


sub new {
    my ($class, $name, $bufferedImage, $bufferedImage2, $frameOne, $frameTwo, $tolerance) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{nonMatchingPixelVector} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{bufferedImages}->[0] = $bufferedImage;
        $self->{bufferedImages}->[1] = $bufferedImage2;
        $self->{frameOne} = $frameOne;
        $self->{frameTwo} = $frameTwo;
        $self->setTolerance(0);
        my $imageHeight = $bufferedImage->getHeight();
        my $imageWidth = $bufferedImage->getWidth();
        if ($bufferedImage->getHeight() != $bufferedImage2->getHeight()) {
            $self->{isSameHeight} = 0;
            if ($imageHeight > $bufferedImage2->getHeight()) {
                $imageHeight = $bufferedImage2->getHeight();
            }
        } else {
            $self->{isSameHeight} = 1;
        }
        if ($bufferedImage->getWidth() != $bufferedImage2->getWidth()) {
            $self->{isSameWidth} = 0;
            if ($imageWidth > $bufferedImage2->getWidth()) {
                $imageWidth = $bufferedImage2->getWidth();
            }
        } else {
            $self->{isSameWidth} = 1;
        }
        $self->{imageWidth} = $imageWidth;
        $self->{imageHeight} = $imageHeight;
        if (!$self->{isSameWidth} || !$self->{isSameHeight}) {
            my $imageUtil = 'org::allbinary::media::image::ImageUtil'->getInstance();
            $self->{logUtil}->putF("Images were not the same size? Most likely a resolution change.", $self, $self->{commonStrings}->{CONSTRUCTOR});
            $self->{logUtil}->putF("1: " . $imageUtil->toString($bufferedImage), $self, $self->{commonStrings}->{CONSTRUCTOR});
            $self->{logUtil}->putF("2: " . $imageUtil->toString($bufferedImage2), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub getMatchingPercent {
    my ($self) = @_;
        if ($self->{matchingPercent} == -1) {
            $self->{matchingPercent} = $self->{pixelsThatMatch} / ($self->{imageWidth} * $self->{imageHeight});
        }
        return $self->{matchingPercent};
}


sub add {
    my ($self, $pixel) = @_;
        $self->{nonMatchingPixelVector}->add($pixel);
}


sub getNonMatchingPixelVector {
    my ($self) = @_;
        return $self->{nonMatchingPixelVector};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append("ImageComparisonInfo: ")->append($self->{name})->append(" Number Of Matching Pixels: ")->appendint($self->{pixelsThatMatch})->append("\nNumber Of Non-Matching Pixels: ")->appendint($self->getNonMatchingPixelVector()->size())->append("\nNumber Of Pixels Ignored: ")->appendint($self->{pixelsIgnored})->append("\nMatching Percentage: ")->appendfloat($self->getMatchingPercent())->toString();
}


sub getBufferedImages {
    my ($self) = @_;
        return $self->{bufferedImages};
}


sub getTolerance {
    my ($self) = @_;
        return $self->{tolerance};
}


sub setTolerance {
    my ($self, $tolerance) = @_;
        $self->{tolerance} = $tolerance;
}


sub getFrameOne {
    my ($self) = @_;
        return $self->{frameOne};
}


sub getFrameTwo {
    my ($self) = @_;
        return $self->{frameTwo};
}

# use java::awt::image::BufferedImage;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::comparison::pixel::PixelDelta;
use org::allbinary::string::CommonStrings;

1;

