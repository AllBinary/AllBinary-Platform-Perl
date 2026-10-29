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

package org::allbinary::logic::string::StringUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::string::StringUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{INIT_STRING} = ("" . "");
    $self->{NULL_STRING} = "null";
    $self->{EMPTY_STRING} = "";
    $self->{ONE_EMPTY_STRING_ARRAY} = [$self->{EMPTY_STRING}];
    $self->{stringArray} = [(undef) x (0)];
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::string::StringUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getNonNull {
    my ($self, $string) = @_;
        if (!defined($string)) {
            return $self->{EMPTY_STRING};
        } else {
            return $string;
        }
}


sub getArrayInstance {
    my ($self) = @_;
        return $self->{stringArray};
}


sub count {
    my ($self, $string, $aChar) = @_;
        my $count = 0;
        my $size = length($string);
        for (my $index = 0; $index < $size; $index++) {
            if (substr($string, $index, 1) eq $aChar) {
                $count++;
            }
        }
        return $count;
}


sub toString {
    my ($self, $anyType) = @_;
        if (defined($anyType)) {
            return $anyType->toString();
        } else {
            return $self->{NULL_STRING};
        }
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;

1;

