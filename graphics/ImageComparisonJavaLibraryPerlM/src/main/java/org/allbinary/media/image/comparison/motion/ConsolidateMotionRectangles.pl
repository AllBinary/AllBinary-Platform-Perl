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

package org::allbinary::media::image::comparison::motion::ConsolidateMotionRectangles;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::comparison::motion::MotionRectangles';

our $NAME = "consolidatedMotionRectangles_";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $motionRectangles) = @_;
    my $self = $class->SUPER::new($NAME, $motionRectangles->getImageComparisonResult());
    $self->_init_fields();
        # super(...) made $self above
        my $vector = $motionRectangles->getVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $motionRectangle = $vector->get($index);
            $vector->add($motionRectangle->clone());
        }
        $self->consolidateMotionRectangles();
    return $self;
}


sub consolidateMotionRectangles {
    my ($self) = @_;
        my $vector = $self->getVector();
        $self->{logUtil}->putF("Start - Size Before: " . $vector->size(), $self, "consolidateMotionRectangleConstraints");
        my $removeVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $motionRectangle = $vector->get($index);
            for (my $i = $index + 1; $i < $vector->size(); $i++) {
                my $motionRectangle2 = $vector->get($i);
                my $rectangle = $motionRectangle->getRectangle();
                my $rectangle2 = $motionRectangle2->getRectangle();
                my $x2 = $rectangle->{x} + $rectangle->{width};
                my $y2 = $rectangle->{y} + $rectangle->{height};
                my $rightX = $rectangle2->{x} + $rectangle2->{width};
                my $bottomY = $rectangle2->{y} + $rectangle2->{height};
                if ($rectangle->{x} <= $rectangle2->{x} && $rectangle->{y} <= $rectangle2->{y} && $x2 >= $rightX && $y2 >= $bottomY) {
                    $removeVector->add($motionRectangle2);
                }
            }
        }
        $self->remove($removeVector);
}


sub remove {
    my ($self, $removeVector) = @_;
        my $vector = $self->getVector();
        my $size = $removeVector->size();
        for (my $index = 0; $index < $size; $index++) {
            $vector->remove($removeVector->get($index));
        }
}

# use java::awt;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::comparison::motion::MotionRectangles;

1;

