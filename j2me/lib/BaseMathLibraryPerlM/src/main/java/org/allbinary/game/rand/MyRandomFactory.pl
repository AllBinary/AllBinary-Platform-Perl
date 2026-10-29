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

#Do not use in client code for money related things.
package org::allbinary::game::rand::MyRandomFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();

our $instance = 'org::allbinary::game::rand::MyRandomFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{mathUtil} = 'org::allbinary::logic::math::MathUtil'->getInstance();
    $self->{rand} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::rand::MyRandomFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{rand} = 'java::util::Random'->new(int(Time::HiRes::time() * 1000));
    return $self;
}


sub setSeed {
    my ($self, $seed) = @_;
        $self->{rand} = 'java::util::Random'->new($seed);
}


sub getNextInt {
    my ($self, $range) = @_;
        my $div = (2147483647 / $range) + 1;
        return int(($self->{rand}->nextInt() / $div));
}


sub getAbsoluteNextInt {
    my ($self, $range) = @_;
        return $self->{mathUtil}->abs($self->getNextInt($range));
}


sub getAbsoluteNextIntAllowZero {
    my ($self, $range) = @_;
        if ($range == 0) {
            return 0;
        } else {
            return $self->{mathUtil}->abs($self->getNextInt($range));
        }
}


sub shuffle {
    my ($self, $intArray) = @_;
        $self->shuffleTotal($intArray, scalar(@{$intArray}) * 7);
}


sub shuffleTotal {
    my ($self, $intArray, $shuffleTotal) = @_;
        my $size = scalar(@{$intArray});
        my $randomIndex = 0;
        my $randomIndex2 = 0;
        my $value = 0;
        for (my $index = 0; $index < $shuffleTotal; $index++) {
            $randomIndex = $self->getAbsoluteNextIntAllowZero($size);
            $randomIndex2 = $self->getAbsoluteNextIntAllowZero($size);
            $value = $intArray->[$randomIndex];
            $intArray->[$randomIndex] = $intArray->[$randomIndex2];
            $intArray->[$randomIndex2] = $value;
        }
}


sub shuffle2 {
    my ($self, $intArray, $intArray2) = @_;
        $self->shuffle2Total($intArray, $intArray2, scalar(@{$intArray}) * 7);
}


sub shuffle2Total {
    my ($self, $intArray, $intArray2, $shuffleTotal) = @_;
        my $size = scalar(@{$intArray});
        my $randomIndex = 0;
        my $randomIndex2 = 0;
        my $value = 0;
        my $value2 = 0;
        for (my $index = 0; $index < $shuffleTotal; $index++) {
            $randomIndex = $self->getAbsoluteNextIntAllowZero($size);
            $randomIndex2 = $self->getAbsoluteNextIntAllowZero($size);
            $value = $intArray->[$randomIndex];
            $value2 = $intArray2->[$randomIndex];
            $intArray->[$randomIndex] = $intArray->[$randomIndex2];
            $intArray->[$randomIndex2] = $value;
            $intArray2->[$randomIndex] = $intArray2->[$randomIndex2];
            $intArray2->[$randomIndex2] = $value2;
        }
}


sub main {
    my ($class, $args) = @_;
        my $randomFactory = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
        my $stringBuilder = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $size2 = 100;
        for (my $index = 0; $index < $size2; $index++) {
            $stringBuilder->appendint(int($randomFactory->getAbsoluteNextInt(3)))->append($commonSeps->{COMMA});
        }
        print($stringBuilder->toString(), "\n");
        $stringBuilder->delete(0, $stringBuilder->length());
        my $intArray = [(0) x (52)];
        my $intArray2 = [(0) x (52)];
        my $size = scalar(@{$intArray});
        for (my $index = 0; $index < $size; $index++) {
            $intArray->[$index] = $index;
            $intArray2->[$index] = $index;
        }
        $randomFactory->shuffle2($intArray, $intArray2);
        for (my $index = 0; $index < $size; $index++) {
            $stringBuilder->appendint($intArray->[$index])->append($commonSeps->{COMMA});
        }
        print($stringBuilder->toString(), "\n");
        $stringBuilder->delete(0, $stringBuilder->length());
        for (my $index = 0; $index < $size; $index++) {
            $stringBuilder->appendint($intArray2->[$index])->append($commonSeps->{COMMA});
        }
        print($stringBuilder->toString(), "\n");
        my $found = 0;
        for (my $index = 0; $index < $size; $index++) {
            $found = 0;
            for (my $index2 = 0; $index2 < $size; $index2++) {
                if ($intArray->[$index2] == $index) {
                    $found = 1;
                }
            }
            if (!$found) {
                die ("RuntimeException");
            }
        }
}

use java::util::Random;
# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use java::lang::System;

1;

