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

package org::allbinary::string::CommonLabels;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::string::CommonLabels'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{WIDTH_LABEL} = " Width: ";
    $self->{HEIGHT_LABEL} = " Height: ";
    $self->{END_LABEL} = "End: ";
    $self->{TOTAL_LABEL} = "Total: ";
    $self->{INDEX_LABEL} = "index: ";
    $self->{START_LABEL} = "Start: ";
    $self->{COMMAND_LABEL} = "Command: ";
    $self->{NAME_LABEL} = "Name: ";
    $self->{START} = $self->{START_LABEL};
    $self->{ELAPSED} = " Elapsed: ";
    $self->{CURRENT} = " Current: ";
    $self->{NEXT} = "Next";
    $self->{ITEM_LABEL} = "Item: ";
    $self->{RESULT_} = "Result: ";
    $self->{COLON_SEP} = ": ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::string::CommonLabels::instance;
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;

1;

