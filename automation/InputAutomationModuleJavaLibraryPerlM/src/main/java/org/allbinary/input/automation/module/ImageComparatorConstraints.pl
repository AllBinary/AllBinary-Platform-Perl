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

package org::allbinary::input::automation::module::ImageComparatorConstraints;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::comparison::ImageComparatorConstraintsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{avoidVector} = undef;
    $self->{maxNonMatchingPixelDeltas} = 0;
    $self->{doImageComparisonEveryNthFrame} = undef;
}


sub new {
    my ($class, $doImageComparisonEveryNthFrame) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{doImageComparisonEveryNthFrame} = $doImageComparisonEveryNthFrame;
        $self->setAvoidVector('org::allbinary::util::BasicArrayListD'->new());
    return $self;
}


sub getAvoidVector {
    my ($self) = @_;
        return $self->{avoidVector};
}


sub isColorAllowed {
    my ($self, $frame, $point, $color) = @_;
        die ("RuntimeException");
}


sub isCollisionWithAvoidRectangles {
    my ($self, $rectangle) = @_;
        my $isCollsionWithAvoidRectangles = 0;
        my $avoidVector = $self->getAvoidVector();
        my $size = $avoidVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $avoidRectangle = $avoidVector->get($index);
            if ('org::allbinary::collision::RectangleCollisionUtil'->isCollision($avoidRectangle, $rectangle)) {
                $isCollsionWithAvoidRectangles = 1;
            }
        }
        return $isCollsionWithAvoidRectangles;
}


# Java overloaded method: Perl keeps the last definition
sub isCollisionWithAvoidRectangles {
    my ($self, $point) = @_;
        my $isCollsionWithAvoidRectangles = 0;
        my $avoidVector = $self->getAvoidVector();
        my $size = $avoidVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $avoidRectangle = $avoidVector->get($index);
            if ('org::allbinary::collision::RectangleCollisionUtil'->isCollision($avoidRectangle, $point)) {
                $isCollsionWithAvoidRectangles = 1;
                last;
            }
        }
        return $isCollsionWithAvoidRectangles;
}


sub setAvoidVector {
    my ($self, $avoidVector) = @_;
        $self->{avoidVector} = $avoidVector;
}


sub getMaxNonMatchingPixelDeltas {
    my ($self) = @_;
        return $self->{maxNonMatchingPixelDeltas};
}


sub setMaxNonMatchingPixelDeltas {
    my ($self, $maxNonMatchingPixelDeltas) = @_;
        $self->{maxNonMatchingPixelDeltas} = $maxNonMatchingPixelDeltas;
}


sub isFrameAllowed {
    my ($self, $frame) = @_;
        my $remainder = (($frame + 1) % $self->{doImageComparisonEveryNthFrame});
        $self->{logUtil}->putF(" Frame: " . $frame . " remainder: " . $remainder . " this.doImageComparisonEveryNthFrame: " . $self->{doImageComparisonEveryNthFrame}, $self, "isCollisionWithAvoidRectangles");
        if ($remainder == 0) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub isImageValid {
    my ($self, $bufferedImage) = @_;
        die ("RuntimeException");
}


sub log {
    my ($self) = @_;
        my $avoidVector = $self->getAvoidVector();
        my $size = $avoidVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $avoidRectangle = $avoidVector->get($index);
            $self->{logUtil}->putF("Avoid Rectangle: " . $avoidRectangle, $self, "log");
        }
}

# use java::awt::Color;
# use java::awt::Rectangle;
# use java::awt::image::BufferedImage;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::collision::RectangleCollisionUtil;
use org::allbinary::graphics::GPoint;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::comparison::ImageComparatorConstraintsInterface;

1;

