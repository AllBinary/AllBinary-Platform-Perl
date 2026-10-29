# Generated Code Do Not Modify

package org::allbinary::physics::movement::PreciseConstantVelocityMovement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::BasicConstantVelocityMovement';


sub _init_fields {
    my ($self) = @_;
    $self->{accumulatedX} = 0;
    $self->{accumulatedY} = 0;
    $self->{accumulatedZ} = 0;
    $self->{factorValue} = 'org::allbinary::logic::math::ScaleFactorFactory'->getInstance()->{DEFAULT_SCALE_VALUE};
}


sub new {
    my ($class, $basicDecimal, $velocityProperties) = @_;
    my $self = $class->SUPER::new($basicDecimal, $velocityProperties);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub init {
    my ($self, $speedBasicDecimal, $angle, $otherAngle) = @_;
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
        my $mathUtil = 'org::allbinary::logic::math::MathUtil'->getInstance();
        my $velocityProperties = $self->getVelocityProperties();
        $self->{accumulatedX} = int(($self->{accumulatedX} + $velocityProperties->getVelocityXBasicDecimalP()->getUnscaled()));
        $self->{accumulatedY} = int(($self->{accumulatedY} + $velocityProperties->getVelocityYBasicDecimalP()->getUnscaled()));
        $self->{accumulatedZ} = int(($self->{accumulatedZ} + $velocityProperties->getVelocityZBasicDecimalP()->getUnscaled()));
        $layer->moveDXYZ(int($self->{accumulatedX} / $self->{factorValue}), int($self->{accumulatedY} / $self->{factorValue}), int($self->{accumulatedZ} / $self->{factorValue}));
        if ($mathUtil->abs($self->{accumulatedX}) > $self->{factorValue}) {
            $self->{accumulatedX} = 0;
        }
        if ($mathUtil->abs($self->{accumulatedY}) > $self->{factorValue}) {
            $self->{accumulatedY} = 0;
        }
        if ($mathUtil->abs($self->{accumulatedZ}) > $self->{factorValue}) {
            $self->{accumulatedZ} = 0;
        }
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::logic::math::ScaleFactorFactory;
use org::allbinary::physics::movement::BasicConstantVelocityMovement;

1;

