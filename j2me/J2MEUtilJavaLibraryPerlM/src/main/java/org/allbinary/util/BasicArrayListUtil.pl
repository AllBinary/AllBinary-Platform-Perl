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

package org::allbinary::util::BasicArrayListUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::util::BasicArrayListUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_ARRAY_OF_ARRAY} = [map { [(undef) x (0)] } 1 .. (0)];
    $self->{myRandomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
    $self->{immutableInstance} = 'org::allbinary::util::ImmutableBasicArrayList'->new("Immutable", 0);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::util::BasicArrayListUtil::instance;
}


sub getRandom {
    my ($self, $list) = @_;
        my $i_random = $self->getRandomIndex($list);
        return $list->{objectArray}->[$i_random];
}


sub getRandomIndex {
    my ($self, $list) = @_;
        return $self->{myRandomFactory}->getAbsoluteNextInt($list->size());
}


sub reverse {
    my ($self, $list) = @_;
        my $lastMinusOneIndex = $list->size() - 2;
        my $temp = undef;
        my $size = int($lastMinusOneIndex / 2);
        my $secondSwapIndex = 0;
        for (my $index = 0; $index <= $size; $index++) {
            $secondSwapIndex = $lastMinusOneIndex - $index;
            $temp = $list->removeAt($index);
            $list->addAt($index, $list->removeAt($secondSwapIndex));
            $list->addAt($secondSwapIndex + 1, $temp);
        }
}


sub log {
    my ($self, $list) = @_;
        my $S_LABEL = " s: ";
        my $size = $list->size();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{TOTAL_LABEL});
        $stringBuffer->appendint($size);
        for (my $index = $size - 1; $index >= 0; $index--) {
            my $usedList = $list->{objectArray}->[$index];
            $stringBuffer->append($S_LABEL);
            $stringBuffer->appendint($usedList->size());
        }
        return $stringBuffer->toString();
}


sub getImmutableInstance {
    my ($self) = @_;
        return $self->{immutableInstance};
}


sub main {
    my ($class, $args) = @_;
        my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        $list->add($commonPhoneStrings->{ONE});
        $list->add($commonPhoneStrings->{TWO});
        $list->add($commonPhoneStrings->{THREE});
        $list->add($commonPhoneStrings->{FOUR});
        $list->add($commonPhoneStrings->{FIVE});
        $list->add($commonPhoneStrings->{SIX});
        $list->add($commonPhoneStrings->{SEVEN});
        $list->add($commonPhoneStrings->{EIGHT});
        $list->add($commonPhoneStrings->{NINE});
        'org::allbinary::util::BasicArrayListUtil'->getInstance()->reverse($list);
        print($list->toString(), "\n");
}

# use jsinterop::annotations::JsType;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonPhoneStrings;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;
use org::allbinary::util::ImmutableBasicArrayList;
use org::allbinary::util::BasicArrayListD;
use java::lang::System;

1;

