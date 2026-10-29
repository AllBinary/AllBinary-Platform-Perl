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

package org::allbinary::animation::VectorExplosionAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{vectorExplosionGenerator} = 'org::allbinary::animation::VectorExplosionGenerator'->getInstance();
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
    $self->{animationBehaviorFactory} = undef;
}


sub new {
    my ($class, $basicColor, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
        $self->setBasicColorP($basicColor);
    return $self;
}


# throws Exception
sub getInstanceAnimation {
    my ($self, $animationInterface) = @_;
        my $vectorRotationAnimationInterface = $animationInterface;
        my $frame = $vectorRotationAnimationInterface->getFrame();
        my $framePoints = $vectorRotationAnimationInterface->getPoints($frame);
        my $points = $self->{vectorExplosionGenerator}->getInstance($framePoints, 6, $self->{vectorExplosionGenerator}->{ROTATION});
        return 'org::allbinary::animation::VectorRotationAnimation'->new($points, $self->getBasicColorP(), $self->{animationBehaviorFactory}->getOrCreateInstance());
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}

use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::VectorExplosionGenerator;
use org::allbinary::animation::VectorRotationAnimation;

1;

