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

package org::allbinary::logic::string::StringValidationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::string::StringValidationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::string::StringValidationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub containsSpaces {
    my ($self, $value) = @_;
        if (index($value, " ") >= 0) {
            return 1;
        }
        return 0;
}


sub isNumber {
    my ($self, $value) = @_;
        my $numberOfDecimalPoints = 0;
        for (my $index = 0; $index < length($value); $index++) {
            my $digit = substr($value, $index, 1);
            if (!$self->isNumberFromChar($digit) && $digit ne ".") {
                return 0;
            }
            if ($digit eq ".") {
                $numberOfDecimalPoints++;
                if ($numberOfDecimalPoints > 1) {
                    return 0;
                }
            }
        }
        return 1;
}


sub isNumberFromChar {
    my ($self, $digit) = @_;
        if ($digit ne "0" && $digit ne "1" && $digit ne "2" && $digit ne "3" && $digit ne "4" && $digit ne "5" && $digit ne "6" && $digit ne "7" && $digit ne "8" && $digit ne "9") {
            return 0;
        }
        return 1;
}


sub isValidRequired {
    my ($self, $value, $min, $max) = @_;
        if (!defined($value) || length($value) < $min || length($value) > $max) {
            return 0;
        }
        return 1;
}


sub isValidRequiredNumber {
    my ($self, $value, $min, $max) = @_;
        if ($self->isEmpty($value) || length($value) < $min || length($value) > $max) {
            return 0;
        }
        if (!$self->isNumber($value)) {
            return 0;
        }
        return 1;
}


sub isValidNotRequired {
    my ($self, $value, $min, $max) = @_;
        if (defined($value)) {
            if (length($value) < $min || length($value) > $max) {
                return 0;
            }
        }
        return 1;
}


sub isValidNotRequiredNumber {
    my ($self, $value, $min, $max) = @_;
        if (defined($value)) {
            if ($self->{tsUtil}->compareTo($value, $self->{stringUtil}->{NULL_STRING}) == 0 || length($value) < $min || length($value) > $max) {
                return 0;
            }
            if (!$self->isNumber($value)) {
                return 0;
            }
        }
        return 1;
}


sub isEmpty {
    my ($self, $string) = @_;
        if (defined($string) && $self->{tsUtil}->compareTo($string, $self->{stringUtil}->{NULL_STRING}) != 0 && $self->{tsUtil}->compareTo($string, $self->{stringUtil}->{EMPTY_STRING}) != 0) {
            return 0;
        } else {
            return 1;
        }
}

use org::allbinary::TsUtil;
use org::allbinary::logic::string::StringUtil;

1;

