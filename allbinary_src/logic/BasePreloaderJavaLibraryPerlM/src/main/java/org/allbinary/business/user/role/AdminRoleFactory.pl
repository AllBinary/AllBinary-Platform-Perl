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

package org::allbinary::business::user::role::AdminRoleFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::role::AdminRoleFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{adminRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{storeAdminRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{storeManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{productManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{reviewManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{customerManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{workflowManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{orderManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{adjusterManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{shippingManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{webManagementRoles} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::role::AdminRoleFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $basicUserRoleFactory = 'org::allbinary::business::user::role::BasicUserRoleFactory'->getInstance();
        $self->{adminRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{storeAdminRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{storeAdminRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{storeManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{storeManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{storeManagementRoles}->add($basicUserRoleFactory->{CUSTOMERMANAGER});
        $self->{storeManagementRoles}->add($basicUserRoleFactory->{ADJUSTER});
        $self->{storeManagementRoles}->add($basicUserRoleFactory->{PRODUCTMANAGER});
        $self->{storeManagementRoles}->add($basicUserRoleFactory->{REVIEWER});
        $self->{storeManagementRoles}->add($basicUserRoleFactory->{SHIPPING});
        $self->{productManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{productManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{productManagementRoles}->add($basicUserRoleFactory->{PRODUCTMANAGER});
        $self->{reviewManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{reviewManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{reviewManagementRoles}->add($basicUserRoleFactory->{REVIEWER});
        $self->{customerManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{customerManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{customerManagementRoles}->add($basicUserRoleFactory->{CUSTOMERMANAGER});
        $self->{workflowManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{workflowManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{workflowManagementRoles}->add($basicUserRoleFactory->{WORKFLOWEDITOR});
        $self->{orderManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{orderManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{adjusterManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{adjusterManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{adjusterManagementRoles}->add($basicUserRoleFactory->{ADJUSTER});
        $self->{shippingManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{shippingManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{shippingManagementRoles}->add($basicUserRoleFactory->{SHIPPING});
        $self->{webManagementRoles}->add($basicUserRoleFactory->{ADMINISTRATOR});
        $self->{webManagementRoles}->add($basicUserRoleFactory->{STOREMANAGER});
        $self->{webManagementRoles}->add($basicUserRoleFactory->{WEBMANAGER});
        $self->{webManagementRoles}->add($basicUserRoleFactory->{WORKFLOWEDITOR});
        $self->{webManagementRoles}->add($basicUserRoleFactory->{VIEWEDITOR});
    return $self;
}


sub getProductManagementRoles {
    my ($self) = @_;
        return $self->{productManagementRoles};
}


sub getAdminRoles {
    my ($self) = @_;
        return $self->{adminRoles};
}


sub getStoreAdminRoles {
    my ($self) = @_;
        return $self->{storeAdminRoles};
}


sub getStoreManagementRoles {
    my ($self) = @_;
        return $self->{storeManagementRoles};
}


sub getReviewManagementRoles {
    my ($self) = @_;
        return $self->{reviewManagementRoles};
}


sub getCustomerManagementRoles {
    my ($self) = @_;
        return $self->{customerManagementRoles};
}


sub getWorkflowManagementRoles {
    my ($self) = @_;
        return $self->{workflowManagementRoles};
}


sub getWebManagementRoles {
    my ($self) = @_;
        return $self->{webManagementRoles};
}


sub getShippingManagementRoles {
    my ($self) = @_;
        return $self->{shippingManagementRoles};
}


sub getAdjusterManagementRoles {
    my ($self) = @_;
        return $self->{adjusterManagementRoles};
}


sub getOrderManagementRoles {
    my ($self) = @_;
        return $self->{orderManagementRoles};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::role::BasicUserRoleFactory;

1;

