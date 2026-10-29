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

package org::allbinary::logic::java::bool::BooleanUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::java::bool::BooleanUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::java::bool::BooleanUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getFromString {
    my ($self, $booleanString) = @_;
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        my $booleanFactory = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
        if ($stringValidationUtil->isEmpty($booleanString)) {
            return 0;
        }
        my $booleanStringLowerCase = lc($booleanString);
        if ($self->{tsUtil}->compareTo($booleanStringLowerCase, $booleanFactory->{TRUE_STRING}) == 0) {
            return 1;
        } elsif ($self->{tsUtil}->compareTo($booleanStringLowerCase, $booleanFactory->{FALSE_STRING}) == 0) {
            return 0;
        } else {
            die ("Invalid booleanString - Must be true or false");
        }
}


# throws Exception
sub isStringBoolean {
    my ($self, $booleanString) = @_;
        my $booleanFactory = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
        my $booleanStringLowerCase = lc($booleanString);
        if (($booleanStringLowerCase cmp $booleanFactory->{TRUE_STRING}) == 0 || ($booleanStringLowerCase cmp $booleanFactory->{FALSE_STRING}) == 0) {
            return 1;
        }
        return 0;
}


sub toStringFromBooleanArray {
    my ($self, $booleanArray) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = scalar(@{$booleanArray});
        for (my $index = 0; $index < $size; $index++) {
            $stringMaker->appendboolean($booleanArray->[$index]);
        }
        return $stringMaker->toString();
}

use org::allbinary::TsUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::java::bool::BooleanFactory;

1;

