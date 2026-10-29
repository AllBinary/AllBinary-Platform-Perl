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

package org::allbinary::logic::io::AbIOSystem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::AbIOSystem'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{type} = "java.io";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::AbIOSystem::instance;
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub isType {
    my ($self, $type) = @_;
        if (($self->{type} cmp $type) == 0) {
            return 1;
        } else {
            return 0;
        }
}


1;

