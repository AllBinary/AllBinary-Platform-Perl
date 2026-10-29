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

package org::allbinary::logic::util::visitor::Visitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::visitor::VisitorInterface';

our $instance = 'org::allbinary::logic::util::visitor::Visitor'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{nullUtil} = 'org::allbinary::logic::NullUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        return $self->{nullUtil}->{NULL_OBJECT};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::util::visitor::Visitor::instance;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::util::visitor::VisitorInterface;

1;

