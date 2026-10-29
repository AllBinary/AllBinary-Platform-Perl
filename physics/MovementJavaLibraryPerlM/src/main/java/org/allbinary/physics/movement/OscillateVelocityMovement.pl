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

package org::allbinary::physics::movement::OscillateVelocityMovement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::BasicConstantVelocityMovement';


sub _init_fields {
    my ($self) = @_;
    $self->{oscillateMin} = undef;
    $self->{oscillateMax} = undef;
    $self->{oscillate} = 0;
    $self->{oscillatePositive} = 0;
}


sub new {
    my ($class, $speedBasicDecimal, $oscillateMin, $oscillateMax) = @_;
    my $self = $class->SUPER::new($speedBasicDecimal, 'org::allbinary::game::physics::velocity::VelocityProperties'->new(int($speedBasicDecimal->getUnscaled()), int($speedBasicDecimal->getUnscaled())));
    $self->_init_fields();
        # super(...) made $self above
        $self->{oscillateMin} = $oscillateMin;
        $self->{oscillateMax} = $oscillateMax;
    return $self;
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
        $self->SUPER::process($layer);
        if ($self->{oscillate} < $self->{oscillateMin}) {
            $self->{oscillatePositive} = 1;
        } elsif ($self->{oscillate} > $self->{oscillateMax}) {
            $self->{oscillatePositive} = 0;
        }
        if ($self->{oscillatePositive}) {
            $self->{oscillate}++;
            $self->getVelocityProperties()->getVelocityXBasicDecimalP()->addint(2000);
        } else {
            $self->{oscillate}--;
            $self->getVelocityProperties()->getVelocityXBasicDecimalP()->subtractint(2000);
        }
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::game::physics::velocity::VelocityProperties;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::physics::movement::BasicConstantVelocityMovement;

1;

