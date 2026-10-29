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

package org::allbinary::media::image::comparison::motion::AllMotionRectangles;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::comparison::motion::MotionRectangles';

our $NAME = "allMotionRectangles_";


sub new {
    my ($class, $imageComparisonResult) = @_;
    my $self = $class->SUPER::new($NAME, $imageComparisonResult);
        # super(...) made $self above
        $self->createMotionRectangles($imageComparisonResult);
    return $self;
}


# throws Exception
sub createMotionRectangles {
    my ($self, $imageComparisonInfo) = @_;
        my $vector = $imageComparisonInfo->getNonMatchingPixelVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $pixelDelta = $vector->get($index);
            $self->addPixelDeltaToAMotionRectangle($pixelDelta);
        }
}


# throws Exception
sub addPixelDeltaToExistingMotionRectangle {
    my ($self, $pixelDelta) = @_;
        my $vector = $self->getVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $motionRectangle = $vector->get($index);
            if ($self->shouldPixelDeltaPartOfMotionRectangle($motionRectangle, $pixelDelta)) {
                my $newWidth = $pixelDelta->getPoint()->getX() - $motionRectangle->getRectangle()->{x};
                my $newHeight = $pixelDelta->getPoint()->getY() - $motionRectangle->getRectangle()->{y};
                if ($newWidth < $motionRectangle->getRectangle()->{width}) {
                    $newWidth = $motionRectangle->getRectangle()->{width};
                }
                if ($newHeight < $motionRectangle->getRectangle()->{height}) {
                    $newHeight = $motionRectangle->getRectangle()->{height};
                }
                $motionRectangle->getRectangle()->setSize($newWidth, $newHeight);
                return 1;
            }
        }
        return 0;
}


# throws Exception
sub addPixelDeltaToAMotionRectangle {
    my ($self, $pixelDelta) = @_;
        if (!$self->addPixelDeltaToExistingMotionRectangle($pixelDelta)) {
            my $newRectangle = 'org::allbinary::media::image::comparison::motion::Rectangle'->new($pixelDelta->getPoint()->getX(), $pixelDelta->getPoint()->getY(), 1, 1);
            my $motionRectangle = 'org::allbinary::media::image::comparison::motion::MotionRectangle'->new($newRectangle);
            $motionRectangle->getPixelDeltaVector()->add($pixelDelta);
            $self->getVector()->add($motionRectangle);
        }
}


# throws Exception
sub shouldPixelDeltaPartOfMotionRectangle {
    my ($self, $motionRectangle, $pixelDelta) = @_;
        my $isPixelLeftOfTheRectangle = 0;
        if ($motionRectangle->getRectangle()->{y} > $pixelDelta->getPoint()->getY()) {
            die ("PixelAboveTheRectangle");
        }
        if ($motionRectangle->getRectangle()->{x} > $pixelDelta->getPoint()->getX()) {
            $isPixelLeftOfTheRectangle = 1;
        }
        if (!$isPixelLeftOfTheRectangle) {
            return $self->isPixelDeltaLikelyPartOfMotionRectangle($motionRectangle, $pixelDelta);
        }
        return 0;
}


# throws Exception
sub isPixelDeltaLikelyPartOfMotionRectangle {
    my ($self, $motionRectangle, $pixelDelta) = @_;
        my $maxX = $motionRectangle->getRectangle()->{x} + $motionRectangle->getRectangle()->{width};
        my $maxY = $motionRectangle->getRectangle()->{y} + $motionRectangle->getRectangle()->{height};
        my $horizontalDistance = $pixelDelta->getPoint()->getX() - $maxX;
        my $verticalDistance = $pixelDelta->getPoint()->getY() - $maxY;
        if ($horizontalDistance < $self->{MAX_PIXEL_DISTANCE_THRESHOLD} && $verticalDistance < $self->{MAX_PIXEL_DISTANCE_THRESHOLD}) {
            return 1;
        }
        return 0;
}

# use java::awt;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::media::image::comparison::ImageComparisonResult;
use org::allbinary::media::image::comparison::pixel::PixelDelta;
use org::allbinary::media::image::comparison::motion::MotionRectangles;
use org::allbinary::media::image::comparison::motion::Rectangle;
use org::allbinary::media::image::comparison::motion::MotionRectangle;

1;

