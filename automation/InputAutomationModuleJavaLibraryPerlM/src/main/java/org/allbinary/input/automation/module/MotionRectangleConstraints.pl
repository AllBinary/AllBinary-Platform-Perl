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

package org::allbinary::input::automation::module::MotionRectangleConstraints;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::comparison::motion::MotionRectangleConstraintsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{minDimension} = undef;
    $self->{maxDimension} = undef;
    $self->{maxMotionRectangles} = 0;
    $self->{minArea} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getMinDimension {
    my ($self) = @_;
        return $self->{minDimension};
}


sub getMaxDimension {
    my ($self) = @_;
        return $self->{maxDimension};
}


sub isTooSmall {
    my ($self, $rectangle) = @_;
        if ($rectangle->{width} < $self->getMinDimension()->{width} || $rectangle->{height} < $self->getMinDimension()->{height}) {
            return 1;
        } else {
            return 0;
        }
}


sub isAreaTooSmall {
    my ($self, $rectangle) = @_;
        if ($rectangle->{width} * $rectangle->{height} < $self->getMinArea()) {
            return 1;
        } else {
            return 0;
        }
}


sub isTooBig {
    my ($self, $rectangle) = @_;
        if ($rectangle->{width} > $self->getMaxDimension()->{width} || $rectangle->{height} > $self->getMaxDimension()->{height}) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub isValid {
    my ($self, $frame, $bufferedImage, $rectangle) = @_;
        die ("RuntimeException");
}


sub setMinDimension {
    my ($self, $minDimension) = @_;
        $self->{minDimension} = $minDimension;
}


sub setMaxDimension {
    my ($self, $maxDimension) = @_;
        $self->{maxDimension} = $maxDimension;
}


sub getMaxMotionRectangles {
    my ($self) = @_;
        return $self->{maxMotionRectangles};
}


sub setMaxMotionRectangles {
    my ($self, $maxMotionRectangles) = @_;
        $self->{maxMotionRectangles} = $maxMotionRectangles;
}


sub getMinArea {
    my ($self) = @_;
        return $self->{minArea};
}


sub setMinArea {
    my ($self, $minArea) = @_;
        $self->{minArea} = $minArea;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::media::image::comparison::motion::MotionRectangleConstraintsInterface;

1;

