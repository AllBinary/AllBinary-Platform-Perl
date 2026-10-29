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

package org::allbinary::logic::math::SmallIntegerSingletonFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NEGATIVE_MAX} = 500;
    $self->{POSITIVE_MAX} = 0x2D1;
    $self->{INTEGER_ARRAY} = [(undef) x ($self->{NEGATIVE_MAX} + $self->{POSITIVE_MAX})];
    $self->{STRING_ARRAY} = [(undef) x ($self->{NEGATIVE_MAX} + $self->{POSITIVE_MAX})];
    $self->{MIN} = 0;
    $self->{lastMin} = 0;
    $self->{lastNegativeMin} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::SmallIntegerSingletonFactory::instance;
}


sub getMin {
    my ($self) = @_;
        my $minAllowed = $self->getMinAllowed();
        if ($self->{MIN} <= $minAllowed) {
            if ('org::allbinary::J2MEUtil'->isJ2ME()) {
            } elsif ('org::allbinary::AndroidUtil'->isAndroid()) {
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                $logUtil->putF('org::allbinary::logic::string::StringMaker'->new()->append("Android InputFactory was initialized before GameMidlet: ")->appendint($self->{MIN})->toString(), $self, "getMin");
                $self->initWithRange(0x291, 6);
            } else {
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                $logUtil->putF('org::allbinary::logic::string::StringMaker'->new()->append("InputFactory was initialized before GameMidlet or KeyFactoryInitializer - Currently this is occurs on JS build by TouchMotionGestureFactory constructor: ")->appendint($self->{MIN})->toString(), $self, "getMin");
                $self->initWithRange(0x2D0, 6);
            }
        }
        if ($self->{MIN} <= $minAllowed) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            $logUtil->put("This means you loaded the InputFactory before determining the platform input size requirements.", $self, "getMin", ("Exception"));
        }
        return $self->{MIN};
}


sub getMinAllowed {
    my ($self) = @_;
        if ('org::allbinary::J2MEUtil'->isJ2ME()) {
            return 0;
        } else {
            if ('org::allbinary::AndroidUtil'->isAndroid()) {
                return 0x101;
            } else {
                return 23;
            }
        }
}


sub initWithRange {
    my ($self, $value, $negativeValue) = @_;
        for (my $index = $value - 1; $index >= $self->{lastMin}; $index--) {
            $self->{INTEGER_ARRAY}->[$index + $self->{NEGATIVE_MAX}] = $index;
        }
        for (my $index = $negativeValue - 1; $index >= $self->{lastNegativeMin}; $index--) {
            $self->{INTEGER_ARRAY}->[$index] = -$index;
        }
        if ($self->{lastMin} < $value) {
            $self->{lastMin} = $value;
            $self->{MIN} = $value;
        }
        if ($self->{lastNegativeMin} < $negativeValue) {
            $self->{lastNegativeMin} = $negativeValue;
        }
}


sub init {
    my ($self) = @_;
        if ($self->{lastMin} < $self->{POSITIVE_MAX} || $self->{lastNegativeMin} < $self->{NEGATIVE_MAX}) {
            for (my $index = $self->{POSITIVE_MAX} - 1; $index >= $self->{lastMin}; $index--) {
                $self->{INTEGER_ARRAY}->[$index + $self->{NEGATIVE_MAX}] = $index;
            }
            for (my $index = $self->{NEGATIVE_MAX} - 1; $index >= $self->{lastNegativeMin}; $index--) {
                $self->{INTEGER_ARRAY}->[$index] = -$index;
            }
            $self->{lastMin} = $self->{POSITIVE_MAX};
            $self->{MIN} = $self->{lastMin};
            $self->{lastNegativeMin} = $self->{NEGATIVE_MAX};
        }
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->initWithRange(23, 0);
    return $self;
}


sub getAt {
    my ($self, $index) = @_;
        return $self->{INTEGER_ARRAY}->[$index + $self->{NEGATIVE_MAX}];
}


sub getAtNoThrow {
    my ($self, $index) = @_;
        if ($index + $self->{NEGATIVE_MAX} > scalar(@{$self->{INTEGER_ARRAY}}) - 1) {
            return $self->{INTEGER_ARRAY}->[-1 + $self->{NEGATIVE_MAX}];
        }
        return $self->{INTEGER_ARRAY}->[$index + $self->{NEGATIVE_MAX}];
}


sub createInstance {
    my ($self, $index) = @_;
        my $integer = $self->getAt($index);
        if (!defined($integer)) {
            $integer = $index;
        }
        return $integer;
}


sub getString {
    my ($self, $index) = @_;
        my $i = $index + $self->{NEGATIVE_MAX};
        if (!defined($self->{STRING_ARRAY}->[$i])) {
            $self->{STRING_ARRAY}->[$i] = $self->{INTEGER_ARRAY}->[$i]->toString();
        }
        return $self->{STRING_ARRAY}->[$i];
}

use org::allbinary::AndroidUtil;
use org::allbinary::J2MEUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;

1;

