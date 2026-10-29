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

package org::allbinary::logic::math::PrimitiveLongUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{powerOfTen} = undef;
    $self->{maxValue} = undef;
    $self->{maxDigits} = undef;
    $self->{charArray} = undef;
    $self->{currentTotalDigits} = 0;
    $self->{primitiveLongSingleton} = 'org::allbinary::logic::math::PrimitiveLongSingleton'->getInstance();
}


sub createPowerOfTen {
    my ($class, $powerOfTen) = @_;
        my $primitiveLongUtil = 'org::allbinary::logic::math::PrimitiveLongUtil'->new($powerOfTen, 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
        if ($powerOfTen % 10 != 0) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $primitiveLongUtil, $commonStrings->{CONSTRUCTOR}, ("Max must be power of 10"));
        }
        return $primitiveLongUtil;
}


sub new {
    my ($class, $powerOfTen, $unused) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{maxDigits} = 'org::allbinary::logic::math::MathUtil'->getInstance()->getTotalDigits($powerOfTen);
        $self->{powerOfTen} = $powerOfTen;
        $self->{maxValue} = ($powerOfTen * 10) - 1;
        $self->{charArray} = [("\0") x ($self->{maxDigits})];
    return $self;
}


sub getCharArray {
    my ($self, $value) = @_;
        if ($value < 10) {
            $self->setCurrentTotalDigits(1);
            return $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAYS}->[$value];
        }
        if ($value > $self->{maxValue}) {
            $self->setCurrentTotalDigits(3);
            return $self->{primitiveLongSingleton}->{UNK};
        }
        my $index = 0;
        my $div = $self->{powerOfTen};
        my $lastValue = 0;
        while ($div >= 1) {
            my $digit = int(($value - $lastValue) / $div);
            if ($digit >= 0 && $digit < 10) {
                if ($digit == 0 && $index == 0) {
                } else {
                    $self->{charArray}->[$index++] = $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAY}->[$digit];
                }
                $lastValue += $digit * $div;
            }
            $div = int($div / 10);
        }
        $self->setCurrentTotalDigits($index);
        return $self->{charArray};
}


sub setCurrentTotalDigits {
    my ($self, $currentTotalDigits) = @_;
        $self->{currentTotalDigits} = $currentTotalDigits;
}


sub getCurrentTotalDigits {
    my ($self) = @_;
        return $self->{currentTotalDigits};
}


sub getMaxDigits {
    my ($self) = @_;
        return $self->{maxDigits};
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::math::PrimitiveLongSingleton;
use org::allbinary::logic::math::MathUtil;

1;

