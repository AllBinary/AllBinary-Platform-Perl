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

package org::allbinary::animation::IndependentVectorExplosionRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{framePoints} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY_ARRAY};
    $self->{vectorInfo} = undef;
    $self->{basicColor} = undef;
    $self->{vectorAnimationFactoryInterface} = undef;
    $self->{vectorExplosionGenerator} = 'org::allbinary::animation::VectorExplosionGenerator'->getInstance();
}


sub new {
    my ($class, $vectorInfo, $basicColor, $vectorAnimationFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{vectorInfo} = $vectorInfo;
        $self->{basicColor} = $basicColor;
        $self->{vectorAnimationFactoryInterface} = $vectorAnimationFactoryInterface;
        $self->init();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        $self->{framePoints} = 'org::allbinary::animation::VectorRotationGenerator'->getInstance()->getInstance($self->{vectorInfo});
}


# throws Exception
sub getInstanceAnimation {
    my ($self, $animationInterface) = @_;
        my $frame = 0;
        if (defined($animationInterface)) {
            my $rotationAnimationInterface = $animationInterface;
            $frame = $rotationAnimationInterface->getFrame();
        }
        my $points = $self->{vectorExplosionGenerator}->getInstance($self->{framePoints}->[$frame], 6, $self->{vectorExplosionGenerator}->{ROTATION});
        return $self->{vectorAnimationFactoryInterface}->getInstance($points, $self->{basicColor});
}

use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::NullUtil;
use org::allbinary::vector::VectorInfo;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::VectorRotationGenerator;
use org::allbinary::animation::VectorExplosionGenerator;

1;

