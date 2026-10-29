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

package org::allbinary::game::ag::ai::UpDownVectorAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{velocityInterface} = undef;
    $self->{index} = 0;
}


sub new {
    my ($class, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        my $velocityInterfaceCompositeInterface = $self->getOwnerLayerInterface();
        $self->{velocityInterface} = $velocityInterfaceCompositeInterface->getVelocityProperties();
        $self->{velocityInterface}->getVelocityYBasicDecimalP()->setint(0);
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $y = $self->getOwnerLayerInterface()->getHeight() * 270;
        if ($self->{index} < 5) {
            my $basicDecimal = $self->{velocityInterface}->getVelocityYBasicDecimalP();
            $basicDecimal->setint(0);
            $basicDecimal->addint($y);
            $self->{index}++;
        } elsif ($self->{index} < 10) {
            my $basicDecimal = $self->{velocityInterface}->getVelocityYBasicDecimalP();
            $basicDecimal->setint(0);
            $basicDecimal->subtractint($y);
            $self->{index}++;
        } else {
            $self->{index} = 0;
            $self->processAI($allBinaryLayerManager);
        }
}

use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::game::physics::velocity::VelocityInterfaceCompositeInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::math::BasicDecimal;

1;

