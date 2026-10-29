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

package org::allbinary::business::user::role::BasicUserRoleFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::role::BasicUserRoleFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{INACTIVITYTIMEOUT} = 360000000;
    $self->{CUSTOMERTIMEOUT} = 360000000;
    $self->{CUSTOMERMAXSESSIONTIME} = 360000000;
    $self->{MAXSESSIONTIME} = 360000000;
    $self->{INSTALLER} = 'org::allbinary::business::user::role::BasicUserRole'->new("Installer", 16, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{ADMINISTRATOR} = 'org::allbinary::business::user::role::BasicUserRole'->new("Administrator", 0, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{CUSTOMER} = 'org::allbinary::business::user::role::BasicUserRole'->new("CustomerUser", "Customer User", 1, $self->{CUSTOMERTIMEOUT}, $self->{CUSTOMERMAXSESSIONTIME});
    $self->{SUBSCRIBERCUSTOMER} = 'org::allbinary::business::user::role::BasicUserRole'->new("SubscriberUser", "Subscriber User", 2, $self->{CUSTOMERTIMEOUT}, $self->{CUSTOMERMAXSESSIONTIME});
    $self->{WHOLESALECUSTOMER} = 'org::allbinary::business::user::role::BasicUserRole'->new("WholesaleUser", "Wholesale User", 3, $self->{CUSTOMERTIMEOUT}, $self->{CUSTOMERMAXSESSIONTIME});
    $self->{STOREMANAGER} = 'org::allbinary::business::user::role::BasicUserRole'->new("StoreManager", "Store Manager", 4, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{PRODUCTMANAGER} = 'org::allbinary::business::user::role::BasicUserRole'->new("ProductManager", "Product Manager", 5, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{CUSTOMERMANAGER} = 'org::allbinary::business::user::role::BasicUserRole'->new("UserManager", "User Manager", 6, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{PAYMENTMANAGER} = 'org::allbinary::business::user::role::BasicUserRole'->new("PaymentManager", "Payment Manager", 7, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{ORDERMANAGER} = 'org::allbinary::business::user::role::BasicUserRole'->new("OrderManager", "Order Manager", 8, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{WEBMANAGER} = 'org::allbinary::business::user::role::BasicUserRole'->new("WebManager", "Web Manager", 9, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{REVIEWER} = 'org::allbinary::business::user::role::BasicUserRole'->new("Reviewer", 10, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{SHIPPING} = 'org::allbinary::business::user::role::BasicUserRole'->new("Shipping", 11, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{ADJUSTER} = 'org::allbinary::business::user::role::BasicUserRole'->new("Adjuster", 12, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{WORKFLOWEDITOR} = 'org::allbinary::business::user::role::BasicUserRole'->new("WorkFlowEditor", "WorkFlow Editor", 13, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{WIZARD} = 'org::allbinary::business::user::role::BasicUserRole'->new("WizardUser", "Wizard User", 14, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
    $self->{VIEWEDITOR} = 'org::allbinary::business::user::role::BasicUserRole'->new("ViewEditor", "View Editor", 15, $self->{MAXSESSIONTIME}, $self->{INACTIVITYTIMEOUT});
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::role::BasicUserRoleFactory::instance;
}

use org::allbinary::business::user::role::BasicUserRole;

1;

