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

package org::allbinary::game::ag::layer::hud::basic::time::Timer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{startTime} = -1;
    $self->{hundredthTime} = 0;
    $self->{maxTime} = undef;
    $self->{modifier} = 0;
    $self->{hundrethsString} = 'org::allbinary::logic::math::PrimitiveLongSingleton'->getInstance()->{ZERO};
    $self->{totalDigits} = 1;
    $self->{primitiveLongUtil} = undef;
    $self->{MAX} = ["L", "O", "L"];
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
}


sub new {
    my ($class, $maxTime) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen($maxTime);
        $self->{maxTime} = $maxTime;
    return $self;
}


sub start {
    my ($self) = @_;
        $self->{hundredthTime} = 0;
        $self->{startTime} = $self->{gameTickTimeDelayHelper}->{startTime};
}


sub get {
    my ($self) = @_;
        return $self->{hundredthTime};
}


sub update {
    my ($self) = @_;
        my $lastLowerTime = $self->{hundredthTime};
        my $currentTime = (($self->{modifier} + $self->{gameTickTimeDelayHelper}->{startTime}) - $self->{startTime});
        if ($currentTime < 0) {
            $currentTime = 0;
        }
        $self->{hundredthTime} = int($currentTime / 100);
        if ($self->{hundredthTime} >= $self->{maxTime}) {
            if ($self->{startTime} > 0) {
                $self->{hundrethsString} = $self->{MAX};
            }
        } elsif ($lastLowerTime != $self->{hundredthTime}) {
            $self->{hundrethsString} = $self->{primitiveLongUtil}->getCharArray($self->{hundredthTime});
            $self->{totalDigits} = $self->{primitiveLongUtil}->getCurrentTotalDigits();
        }
}


sub reduce {
    my ($self, $value) = @_;
        $self->{modifier} -= $value;
}


sub add {
    my ($self, $value) = @_;
        $self->{modifier} += $value;
}


sub getTimeChars {
    my ($self) = @_;
        return $self->{hundrethsString};
}


sub getCurrentTotalDigits {
    my ($self) = @_;
        return $self->{totalDigits};
}

use org::allbinary::logic::math::PrimitiveLongSingleton;
use org::allbinary::logic::math::PrimitiveLongUtil;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;

1;

