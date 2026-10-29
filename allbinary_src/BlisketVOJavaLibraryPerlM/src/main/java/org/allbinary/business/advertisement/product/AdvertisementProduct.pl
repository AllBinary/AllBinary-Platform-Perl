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

package org::allbinary::business::advertisement::product::AdvertisementProduct;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::product::AdvertisementProductInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{type} = undef;
    $self->{link} = undef;
    $self->{number} = 0;
    $self->{constraint} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub getLink {
    my ($self) = @_;
        return $self->{link};
}


sub getNumber {
    my ($self) = @_;
        return $self->{number};
}


sub getTwoDimensionalConstraint {
    my ($self) = @_;
        return $self->{constraint};
}

use org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface;
use org::allbinary::business::advertisement::product::AdvertisementProductInterface;

1;

