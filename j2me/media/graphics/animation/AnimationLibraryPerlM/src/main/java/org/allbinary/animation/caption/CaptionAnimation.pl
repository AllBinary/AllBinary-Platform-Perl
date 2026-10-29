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

package org::allbinary::animation::caption::CaptionAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::Animation';


sub _init_fields {
    my ($self) = @_;
    $self->{animationInterface} = undef;
    $self->{overlayAnimationInterface} = undef;
    $self->{captionDx} = undef;
    $self->{captionDy} = undef;
    $self->{dx} = undef;
    $self->{dy} = undef;
}


sub new {
    my ($class, $animationInterface, $overlayAnimationInterface, $captionDx, $captionDy, $dx, $dy) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{animationInterface} = $animationInterface;
        $self->{overlayAnimationInterface} = $overlayAnimationInterface;
        $self->{captionDx} = $captionDx;
        $self->{captionDy} = $captionDy;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
    return $self;
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{animationInterface}->paintXY($graphics, $x + $self->{captionDx}, $y + $self->{captionDy});
        $self->{overlayAnimationInterface}->paintXY($graphics, $x + $self->{captionDx} + $self->{dx}, $y + $self->{captionDy} + $self->{dy});
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
        $self->{animationInterface}->paintThreedXYZ($graphics, $x + $self->{captionDx}, $y + $self->{captionDy}, $z);
        $self->{overlayAnimationInterface}->paintThreedXYZ($graphics, $x + $self->{captionDx} + $self->{dx}, $y + $self->{captionDy} + $self->{dy}, $z);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;

1;

