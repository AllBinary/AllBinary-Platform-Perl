# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::identification::GroupCommonFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{ID} = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(10);
    $self->{GROUP_NAME_LABEL} = "Group Name: ";
    $self->{ID_LABEL} = " Id: ";
    $self->{ADDING_LABEL} = "Adding: ";
    $self->{TO_LABEL} = " to: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::identification::GroupCommonFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::identification::GroupCommonFactory::instance = 'org::allbinary::game::identification::GroupCommonFactory'->new();
        }
        return $org::allbinary::game::identification::GroupCommonFactory::instance;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;

1;

