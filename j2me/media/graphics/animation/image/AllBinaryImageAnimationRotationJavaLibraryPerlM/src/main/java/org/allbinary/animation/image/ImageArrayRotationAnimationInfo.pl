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

package org::allbinary::animation::image::ImageArrayRotationAnimationInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{imageArray} = undef;
    $self->{angleIncrement} = undef;
    $self->{totalAngle} = undef;
    $self->{dx} = undef;
    $self->{dy} = undef;
}


sub new {
    my ($class, $imageArray, $angleIncrement, $totalAngle, $dx, $dy) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{imageArray} = $imageArray;
        $self->{angleIncrement} = $angleIncrement;
        $self->{totalAngle} = $totalAngle;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


sub setImageArray {
    my ($self, $imageArray) = @_;
        $self->{imageArray} = $imageArray;
}


sub getImageArray {
    my ($self) = @_;
        return $self->{imageArray};
}


sub getAngleInfoP {
    my ($self) = @_;
        return 'org::allbinary::math::AngleInfo'->getInstance(((int($self->{angleIncrement}) + 32768) % 65536 - 32768));
}


sub setTotalAngle {
    my ($self, $totalAngle) = @_;
        $self->{totalAngle} = $totalAngle;
}


sub getTotalAngle {
    my ($self) = @_;
        return $self->{totalAngle};
}


sub setDx {
    my ($self, $dx) = @_;
        $self->{dx} = $dx;
}


sub getDx {
    my ($self) = @_;
        return $self->{dx};
}


sub setDy {
    my ($self, $dy) = @_;
        $self->{dy} = $dy;
}


sub getDy {
    my ($self) = @_;
        return $self->{dy};
}

# use javax::microedition::lcdui::Image;
use org::allbinary::math::AngleInfo;

1;

