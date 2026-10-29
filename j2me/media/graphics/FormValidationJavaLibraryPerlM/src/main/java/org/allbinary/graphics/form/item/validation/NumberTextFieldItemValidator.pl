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

package org::allbinary::graphics::form::item::validation::NumberTextFieldItemValidator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::ValidatorBase';


sub _init_fields {
    my ($self) = @_;
    $self->{textFieldItem} = undef;
    $self->{min} = undef;
    $self->{max} = undef;
    $self->{maxChars} = undef;
}


sub new {
    my ($class, $textFieldItem, $maxChars, $min, $max) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{textFieldItem} = $textFieldItem;
        $self->{min} = $min;
        $self->{max} = $max;
        $self->{maxChars} = $maxChars;
    return $self;
}


sub isNumberValid {
    my ($self, $value) = @_;
        return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
}


sub toNumberVector {
    my ($self, $value) = @_;
        return 'org::allbinary::util::BasicArrayListD'->new();
}


sub isValid {
    my ($self) = @_;
        my $result = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
        my $string = $self->{textFieldItem}->getString();
        my $textLength = length($string);
        if ($textLength > 0 && $textLength < $self->{maxChars}) {
            try {
                int($self->{textFieldItem}->getString());
            } catch ($e) {
                $result = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
            }
        } else {
            if ($textLength < 1) {
                $result = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
            } elsif ($textLength > $self->{maxChars}) {
                $result = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{FALSE};
            }
        }
        return $result;
}


sub toList {
    my ($self) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $string = $self->{textFieldItem}->getString();
        my $textLength = length($string);
        my $label = $self->{textFieldItem}->getLabel();
        my $name = substr($label, 0, (length($label) - 2) - (0));
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        if ($textLength > 0 && $textLength < $self->{maxChars}) {
            try {
                my $number = $smallIntegerSingletonFactory->createInstance(int($self->{textFieldItem}->getString()));
                if (int($number) > $self->{min}) {
                    $stringMaker->delete(0, $stringMaker->length());
                    $list->add($stringMaker->append($name)->append(" is to small")->toString());
                } elsif (int($number) > $self->{max}) {
                    $stringMaker->delete(0, $stringMaker->length());
                    $list->add($stringMaker->append($name)->append(" is to large")->toString());
                }
            } catch ($e) {
                $stringMaker->delete(0, $stringMaker->length());
                $list->add($stringMaker->append($name)->append(" is not a number")->toString());
            }
        } else {
            if ($textLength < 1) {
                $stringMaker->delete(0, $stringMaker->length());
                $list->add($stringMaker->append($name)->append(" is to short")->toString());
            } elsif ($textLength > $self->{maxChars}) {
                $stringMaker->delete(0, $stringMaker->length());
                $list->add($stringMaker->append($name)->append(" is to long")->toString());
            }
        }
        return $list;
}

use org::allbinary::graphics::form::item::ABTextFieldItem;
use org::allbinary::logic::control::validate::ValidatorBase;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

