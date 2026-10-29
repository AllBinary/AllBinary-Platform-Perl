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

package org::allbinary::vector::VectorInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{width} = undef;
    $self->{height} = undef;
    $self->{points} = undef;
    $self->{totalFrames} = undef;
}


sub new {
    my ($class, $width, $height, $points, $totalFrames) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{width} = $width;
        $self->{height} = $height;
        $self->{points} = $points;
        $self->{totalFrames} = $totalFrames;
    return $self;
}


sub getWidth {
    my ($self) = @_;
        return $self->{width};
}


sub setWidth {
    my ($self, $width) = @_;
        $self->{width} = $width;
}


sub getHeight {
    my ($self) = @_;
        return $self->{height};
}


sub setHeight {
    my ($self, $height) = @_;
        $self->{height} = $height;
}


sub getPoints {
    my ($self) = @_;
        return $self->{points};
}


sub setPoints {
    my ($self, $points) = @_;
        $self->{points} = $points;
}


sub getTotalFrames {
    my ($self) = @_;
        return $self->{totalFrames};
}


sub setTotalFrames {
    my ($self, $totalFrames) = @_;
        $self->{totalFrames} = $totalFrames;
}


1;

