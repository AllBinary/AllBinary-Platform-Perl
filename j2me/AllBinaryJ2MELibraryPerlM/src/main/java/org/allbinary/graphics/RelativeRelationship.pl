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

package org::allbinary::graphics::RelativeRelationship;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_RELATIVE_RELATIONSHIP = 'org::allbinary::graphics::RelativeRelationship'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance());

sub _init_fields {
    my ($self) = @_;
    $self->{typesAllowedList} = undef;
    $self->{x} = undef;
    $self->{y} = undef;
    $self->{z} = undef;
}


sub new {
    my ($class, $point, $typesAllowedList) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{x} = $point->getX();
        $self->{y} = $point->getY();
        $self->{z} = $point->getZ();
        $self->{typesAllowedList} = $typesAllowedList;
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->{x};
}


sub getY {
    my ($self) = @_;
        return $self->{y};
}


sub getZ {
    my ($self) = @_;
        return $self->{z};
}


sub getTypesAllowedList {
    my ($self) = @_;
        return $self->{typesAllowedList};
}


sub setTypesAllowedList {
    my ($self, $typesAllowedList) = @_;
        $self->{typesAllowedList} = $typesAllowedList;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::graphics::PointFactory;

1;

