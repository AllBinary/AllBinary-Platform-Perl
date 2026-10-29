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

package org::allbinary::business::user::commerce::money::Money;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{units} = undef;
    $self->{DEFAULT_CURRENCY} = "USD";
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of Money takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $money) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{units} = $money->getUnits();
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{units} = 0;
    return $self;
}


sub _new1 {
    my ($class, $usDollarStr) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if (defined($usDollarStr) && 'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($usDollarStr)) {
            $self->{units} = $self->convertUsdToUnits($usDollarStr);
        }
    return $self;
}


sub _new1 {
    my ($class, $units) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{units} = $units;
    return $self;
}


sub isValid {
    my ($self) = @_;
        if (defined($self->{units}) && int($self->{units}) > 0 && int($self->{units}) < 9223372036854775807) {
            return 1;
        } else {
            return 0;
        }
}


sub add {
    my ($self, $moreMoney) = @_;
        $self->add($moreMoney->toString());
}


# Java overloaded method: Perl keeps the last definition
sub add {
    my ($self, $usDollarStr) = @_;
        $self->{units} = int($self->{units}) + $self->convertUsdToUnits($usDollarStr);
}


sub subtract {
    my ($self, $usDollarStr) = @_;
        $self->{units} = int($self->{units}) - $self->convertUsdToUnits($usDollarStr);
}


sub multiply {
    my ($self, $multiplier) = @_;
        $self->{units} = int(int($self->{units}) * $multiplier);
}


# Java overloaded method: Perl keeps the last definition
sub multiply {
    my ($self, $multiplier) = @_;
        $self->{units} = int($self->{units}) * $multiplier;
}


sub convertUnitsTo {
    my ($self, $currency) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if (($currency cmp $self->{DEFAULT_CURRENCY}) == 0) {
            my $dollar = int($self->{units}) / 100;
            my $cents = int($self->{units}) - ($dollar * 100);
            $stringBuffer->append($dollar->toString());
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
            if ($cents < 10) {
                $stringBuffer->append('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
            }
            $stringBuffer->append($cents->toString());
        }
        return $stringBuffer->toString();
}


sub convertUsdToUnits {
    my ($self, $usDollarStr) = @_;
        my $localUnit = 0;
        my $index = index($usDollarStr, 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $dollarStr = $stringUtil->{EMPTY_STRING};
        my $centsStr = $stringUtil->{EMPTY_STRING};
        if ($index < 1) {
            $dollarStr = ("" . $usDollarStr);
            $centsStr = "00";
        } else {
            $dollarStr = ("" . substr($usDollarStr, 0, ($index) - (0)));
            $centsStr = ("" . substr($usDollarStr, $index + 1));
        }
        $localUnit = int(int($dollarStr) * 100);
        $localUnit += int($centsStr);
        return $localUnit;
}


sub getUnits {
    my ($self) = @_;
        return int($self->{units});
}


sub getUnitsLong {
    my ($self) = @_;
        return $self->{units};
}


sub toString {
    my ($self) = @_;
        return ("" . $self->convertUnitsTo($self->{DEFAULT_CURRENCY}));
}

use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonPhoneStrings;

1;

