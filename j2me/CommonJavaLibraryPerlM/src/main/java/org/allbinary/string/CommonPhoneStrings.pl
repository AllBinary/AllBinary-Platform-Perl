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

package org::allbinary::string::CommonPhoneStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::string::CommonPhoneStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{UP} = "UP";
    $self->{DOWN} = "DOWN";
    $self->{LEFT} = "LEFT";
    $self->{RIGHT} = "RIGHT";
    $self->{ZERO} = "0";
    $self->{ONE} = "1";
    $self->{TWO} = "2";
    $self->{THREE} = "3";
    $self->{FOUR} = "4";
    $self->{FIVE} = "5";
    $self->{SIX} = "6";
    $self->{SEVEN} = "7";
    $self->{EIGHT} = "8";
    $self->{NINE} = "9";
    $self->{POUND} = "#";
    $self->{STAR} = "*";
    $self->{FIRE} = "FIRE";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::string::CommonPhoneStrings::instance;
}

# use jsinterop::annotations::JsType;

1;

