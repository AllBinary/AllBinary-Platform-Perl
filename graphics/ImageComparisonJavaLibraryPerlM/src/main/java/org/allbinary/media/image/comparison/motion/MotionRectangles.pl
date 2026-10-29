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

package org::allbinary::media::image::comparison::motion::MotionRectangles;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{rectangleVector} = undef;
    $self->{imageComparisonResult} = undef;
    $self->{MAX_PIXEL_DISTANCE_THRESHOLD} = 2;
}


sub new {
    my ($class, $name, $imageComparisonResult) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->setImageComparisonResult($imageComparisonResult);
        $self->setVector('org::allbinary::util::BasicArrayListD'->new());
    return $self;
}


sub getVector {
    my ($self) = @_;
        return $self->{rectangleVector};
}


sub setVector {
    my ($self, $rectangleVector) = @_;
        $self->{rectangleVector} = $rectangleVector;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getImageComparisonResult {
    my ($self) = @_;
        return $self->{imageComparisonResult};
}


sub setImageComparisonResult {
    my ($self, $imageComparisonResult) = @_;
        $self->{imageComparisonResult} = $imageComparisonResult;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::media::image::comparison::ImageComparisonResult;

1;

