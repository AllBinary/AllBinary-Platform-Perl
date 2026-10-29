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

package org::allbinary::animation::image::AllBinaryAdjustedJ2SEImageRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::AllBinaryJ2SEImageRotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = 0;
    $self->{dy} = 0;
}


sub new {
    my ($class, $originalImage, $image, $angleInfo, $totalAngle, $dx, $dy, $animationBehavior) = @_;
    my $self = $class->SUPER::new($originalImage, $image, $angleInfo, $totalAngle, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->init($dx, $dy);
    return $self;
}


# throws Exception
sub init {
    my ($self, $dx, $dy) = @_;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
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


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->SUPER::paintXY($graphics, $x + $self->{dx}, $y + $self->{dy});
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::image::AllBinaryJ2SEImageRotationAnimation;

1;

