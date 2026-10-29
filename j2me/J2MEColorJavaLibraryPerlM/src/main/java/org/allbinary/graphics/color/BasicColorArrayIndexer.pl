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

package org::allbinary::graphics::color::BasicColorArrayIndexer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{basicColorArray} = undef;
    $self->{circularIndexUtil} = undef;
}


sub new {
    my ($class, $basicColorArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicColorArray} = $basicColorArray;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(scalar(@{$self->{basicColorArray}}));
    return $self;
}


sub next {
    my ($self) = @_;
        $self->{circularIndexUtil}->next();
}


sub get {
    my ($self) = @_;
        return $self->{basicColorArray}->[$self->{circularIndexUtil}->getIndex()];
}


sub getBasicColorArray {
    my ($self) = @_;
        return $self->{basicColorArray};
}

# use jsinterop::annotations::JsType;
use org::allbinary::util::CircularIndexUtil;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;

1;

