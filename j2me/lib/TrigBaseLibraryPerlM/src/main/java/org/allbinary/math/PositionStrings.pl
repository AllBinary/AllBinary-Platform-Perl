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

package org::allbinary::math::PositionStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::math::PositionStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{X} = "x";
    $self->{Y} = "y";
    $self->{X_LABEL} = "x: ";
    $self->{Y_LABEL} = "y: ";
    $self->{Z_LABEL} = "z: ";
    $self->{DX_LABEL} = "dx: ";
    $self->{DY_LABEL} = "dy: ";
    $self->{DZ_LABEL} = "dz: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::math::PositionStrings::instance;
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;

1;

