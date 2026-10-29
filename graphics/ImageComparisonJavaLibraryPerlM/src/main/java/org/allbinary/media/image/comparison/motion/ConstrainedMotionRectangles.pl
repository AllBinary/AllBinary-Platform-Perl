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

package org::allbinary::media::image::comparison::motion::ConstrainedMotionRectangles;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::comparison::motion::MotionRectangles';

our $NAME = "constrainedMotionRectangles_";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{motionRectangleConstraintsInterface} = undef;
}


sub new {
    my ($class, $motionRectangleConstraintsInterface, $motionRectangles) = @_;
    my $self = $class->SUPER::new($NAME, $motionRectangles->getImageComparisonResult());
    $self->_init_fields();
        # super(...) made $self above
        $self->setMotionRectangleConstraintsInterface($motionRectangleConstraintsInterface);
    return $self;
}


# throws Exception
sub applyMotionRectangleConstraints {
    my ($self, $motionRectangles) = @_;
        $self->{logUtil}->putF("Start - Size Before: " . $motionRectangles->getVector()->size(), $self, "applyMotionRectangleConstraints");
        my $bufferedImageArray = $motionRectangles->getImageComparisonResult()->getBufferedImages();
        my $bufferedImage = $bufferedImageArray->[1];
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        my $vector2 = $motionRectangles->getVector();
        my $size = $vector2->size();
        for (my $index = 0; $index < $size; $index++) {
            my $motionRectangle = $vector2->get($index);
            my $rectangle = $motionRectangle->getRectangle();
            my $isTooSmall = $self->getMotionRectangleConstraintsInterface()->isTooSmall($rectangle);
            if ($isTooSmall) {
                next;
            }
            my $isAreaTooSmall = $self->getMotionRectangleConstraintsInterface()->isAreaTooSmall($rectangle);
            if ($isAreaTooSmall) {
                next;
            }
            my $isTooBig = $self->getMotionRectangleConstraintsInterface()->isTooBig($rectangle);
            if ($isTooBig) {
                next;
            }
            my $isValid = $self->getMotionRectangleConstraintsInterface()->isValid($self->getImageComparisonResult()->getFrameTwo(), $bufferedImage, $motionRectangle->getRectangle());
            if (!$isValid) {
                next;
            }
            if (!$isTooSmall && !$isAreaTooSmall && !$isTooBig && $isValid) {
                $vector->add($motionRectangle);
            }
        }
        $self->setVector($vector);
}


sub getMotionRectangleConstraintsInterface {
    my ($self) = @_;
        return $self->{motionRectangleConstraintsInterface};
}


sub setMotionRectangleConstraintsInterface {
    my ($self, $motionRectangleConstraintsInterface) = @_;
        $self->{motionRectangleConstraintsInterface} = $motionRectangleConstraintsInterface;
}

# use java::awt::Rectangle;
# use java::awt::image::BufferedImage;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::comparison::motion::MotionRectangles;

1;

