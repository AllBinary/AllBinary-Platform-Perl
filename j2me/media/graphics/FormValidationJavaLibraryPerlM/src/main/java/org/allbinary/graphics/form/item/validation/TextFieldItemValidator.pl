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

package org::allbinary::graphics::form::item::validation::TextFieldItemValidator;
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
    $self->{allowOnEmpty} = undef;
}


sub new {
    my ($class, $textFieldItem, $min, $max, $allowOnEmpty) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{textFieldItem} = $textFieldItem;
        $self->{min} = $min;
        $self->{max} = $max;
        $self->{allowOnEmpty} = $allowOnEmpty;
    return $self;
}


sub isValid {
    my ($self) = @_;
        my $booleanFactory = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
        my $result = $booleanFactory->{TRUE};
        my $string = $self->{textFieldItem}->getString();
        my $textLength = length($string);
        if (($textLength == 0 && $self->{allowOnEmpty}) || $textLength > $self->{min} && $textLength < $self->{max}) {
        } else {
            if ($textLength < $self->{min}) {
                $result = $booleanFactory->{FALSE};
            } elsif ($textLength > $self->{max}) {
                $result = $booleanFactory->{FALSE};
            }
        }
        return $result;
}


sub toList {
    my ($self) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $string = $self->{textFieldItem}->getString();
        my $textLength = length($string);
        if ($textLength > $self->{min} && $textLength < $self->{max}) {
        } else {
            my $label = $self->{textFieldItem}->getLabel();
            my $name = substr($label, 0, (length($label) - 2) - (0));
            if ($textLength < $self->{min}) {
                $list->add('org::allbinary::logic::string::StringMaker'->new()->append($name)->append(" is to short")->toString());
            } elsif ($textLength > $self->{max}) {
                $list->add('org::allbinary::logic::string::StringMaker'->new()->append($name)->append(" is to long")->toString());
            }
        }
        return $list;
}

use org::allbinary::graphics::form::item::ABTextFieldItem;
use org::allbinary::logic::control::validate::ValidatorBase;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

