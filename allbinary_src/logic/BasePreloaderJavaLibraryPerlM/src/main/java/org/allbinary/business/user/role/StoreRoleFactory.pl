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

package org::allbinary::business::user::role::StoreRoleFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::role::StoreRoleFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{roles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{subscriberRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{wholesaleRoles} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::role::StoreRoleFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $basicUserRoleFactory = 'org::allbinary::business::user::role::BasicUserRoleFactory'->getInstance();
        $self->{roles}->add($basicUserRoleFactory->{CUSTOMER});
        $self->{roles}->add($basicUserRoleFactory->{SUBSCRIBERCUSTOMER});
        $self->{roles}->add($basicUserRoleFactory->{WHOLESALECUSTOMER});
        $self->{subscriberRoles}->add($basicUserRoleFactory->{SUBSCRIBERCUSTOMER});
        $self->{wholesaleRoles}->add($basicUserRoleFactory->{WHOLESALECUSTOMER});
    return $self;
}


sub getRoles {
    my ($self) = @_;
        return $self->{roles};
}


sub getSubscriberRoles {
    my ($self) = @_;
        return $self->{subscriberRoles};
}


sub getWholesaleRoles {
    my ($self) = @_;
        return $self->{wholesaleRoles};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::role::BasicUserRoleFactory;

1;

