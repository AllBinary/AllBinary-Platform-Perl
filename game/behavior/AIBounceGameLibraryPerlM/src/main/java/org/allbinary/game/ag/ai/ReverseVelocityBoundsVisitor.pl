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

package org::allbinary::game::ag::ai::ReverseVelocityBoundsVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::bounds::BoundsVisitorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{velocityInterface} = undef;
    $self->{layerInterface} = undef;
}


sub new {
    my ($class, $layerInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{layerInterface} = $layerInterface;
        my $velocityInterfaceCompositeInterface = $layerInterface;
        $self->{velocityInterface} = $velocityInterfaceCompositeInterface->getVelocityProperties();
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->{layerInterface}->getXP();
}


sub getY {
    my ($self) = @_;
        return $self->{layerInterface}->getYP();
}


sub minX {
    my ($self) = @_;
        if ($self->{velocityInterface}->getVelocityXBasicDecimalP()->getUnscaled() < 0) {
            $self->{velocityInterface}->getVelocityXBasicDecimalP()->multiplyint(-1);
        }
}


sub maxX {
    my ($self) = @_;
        if ($self->{velocityInterface}->getVelocityXBasicDecimalP()->getUnscaled() > 0) {
            $self->{velocityInterface}->getVelocityXBasicDecimalP()->multiplyint(-1);
        }
}


sub minY {
    my ($self) = @_;
        if ($self->{velocityInterface}->getVelocityYBasicDecimalP()->getUnscaled() < 0) {
            $self->{velocityInterface}->getVelocityYBasicDecimalP()->multiplyint(-1);
        }
}


sub maxY {
    my ($self) = @_;
        if ($self->{velocityInterface}->getVelocityYBasicDecimalP()->getUnscaled() > 0) {
            $self->{velocityInterface}->getVelocityYBasicDecimalP()->multiplyint(-1);
        }
}

use org::allbinary::bounds::BoundsVisitorInterface;
use org::allbinary::game::physics::velocity::VelocityInterface;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::layer::LayerInterface;
use org::allbinary::logic::communication::log::LogUtil;

1;

