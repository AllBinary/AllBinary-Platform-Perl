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

package org::allbinary::media::image::comparison::motion::MotionRectangle;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{rectangle} = undef;
    $self->{pixelDeltaVector} = undef;
}


sub new {
    my ($class, $rectangle) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setRectangle($rectangle);
        $self->setPixelDeltaVector('org::allbinary::util::BasicArrayListD'->new());
    return $self;
}


sub getRectangle {
    my ($self) = @_;
        return $self->{rectangle};
}


sub setRectangle {
    my ($self, $rectangle) = @_;
        $self->{rectangle} = $rectangle;
}


sub getPixelDeltaVector {
    my ($self) = @_;
        return $self->{pixelDeltaVector};
}


sub setPixelDeltaVector {
    my ($self, $pixelDeltaVector) = @_;
        $self->{pixelDeltaVector} = $pixelDeltaVector;
}


sub clone {
    my ($self) = @_;
        my $motionRectangle = 'org::allbinary::media::image::comparison::motion::MotionRectangle'->new($self->getRectangle()->clone());
        $motionRectangle->setPixelDeltaVector($self->getPixelDeltaVector()->clone());
        return $motionRectangle;
}

# use java::awt::Rectangle;
use java::util::Vector;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

