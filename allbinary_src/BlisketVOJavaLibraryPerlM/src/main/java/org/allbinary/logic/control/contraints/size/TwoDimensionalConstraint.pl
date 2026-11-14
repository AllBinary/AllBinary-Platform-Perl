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

package org::allbinary::logic::control::contraints::size::TwoDimensionalConstraint;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{widthSizeConstraintInterface} = undef;
    $self->{heightSizeConstraintInterface} = undef;
}


sub new {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getHeight {
    my ($self) = @_;
        return $self->{heightSizeConstraintInterface};
}


sub getWidth {
    my ($self) = @_;
        return $self->{widthSizeConstraintInterface};
}


sub setHeight {
    my ($self, $heightSizeConstraintInterface) = @_;
        $self->{heightSizeConstraintInterface} = $heightSizeConstraintInterface;
}


sub setWidth {
    my ($self, $widthSizeConstraintInterface) = @_;
        $self->{widthSizeConstraintInterface} = $widthSizeConstraintInterface;
}

use java::lang::Object ();
use org::w3c::dom::Node ();
use org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface ();

1;

