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

package org::allbinary::graphics::PointFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::PointFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ZERO_ZERO} = $self->createXYZ(0, 0, 0);
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::PointFactory::instance;
}


sub init {
    my ($self) = @_;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub createXY {
    my ($self, $x, $y) = @_;
        return 'org::allbinary::graphics::GPoint'->new($x, $y, 0);
}


sub createXYZ {
    my ($self, $x, $y, $z) = @_;
        return 'org::allbinary::graphics::GPoint'->new($x, $y, $z);
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;
use org::allbinary::graphics::GPoint;

1;

