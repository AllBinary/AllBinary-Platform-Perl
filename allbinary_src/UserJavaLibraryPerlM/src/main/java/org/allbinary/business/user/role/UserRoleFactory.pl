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

package org::allbinary::business::user::role::UserRoleFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::role::UserRoleFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{basicUserRoleFactory} = 'org::allbinary::business::user::role::BasicUserRoleFactory'->getInstance();
    $self->{INSTALLER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{INSTALLER}, undef);
    $self->{ADMINISTRATOR} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{ADMINISTRATOR}, 'org::allbinary::business::user::modules::admin::AdminUserFactory'->new());
    $self->{CUSTOMER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{CUSTOMER}, 'org::allbinary::business::user::modules::UserFactory'->new());
    $self->{SUBSCRIBERCUSTOMER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{SUBSCRIBERCUSTOMER}, 'org::allbinary::business::user::modules::customer::subscriber::SubscriberUserFactory'->new());
    $self->{WHOLESALECUSTOMER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{WHOLESALECUSTOMER}, 'org::allbinary::business::user::modules::customer::wholesale::WholesaleUserFactory'->new());
    $self->{STOREMANAGER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{STOREMANAGER}, 'org::allbinary::business::user::modules::admin::store::StoreAdminUserFactory'->new());
    $self->{PRODUCTMANAGER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{PRODUCTMANAGER}, 'org::allbinary::business::user::modules::admin::store::product::ProductStoreAdminUserFactory'->new());
    $self->{CUSTOMERMANAGER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{CUSTOMERMANAGER}, 'org::allbinary::business::user::modules::admin::store::customer::CustomerStoreAdminUserFactory'->new());
    $self->{PAYMENTMANAGER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{PAYMENTMANAGER}, 'org::allbinary::business::user::modules::admin::store::payment::PaymentStoreAdminUserFactory'->new());
    $self->{ORDERMANAGER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{ORDERMANAGER}, 'org::allbinary::business::user::modules::admin::store::order::OrderStoreAdminUserFactory'->new());
    $self->{WEBMANAGER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{WEBMANAGER}, 'org::allbinary::business::user::modules::admin::store::web::WebStoreAdminUserFactory'->new());
    $self->{REVIEWER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{REVIEWER}, 'org::allbinary::business::user::modules::admin::store::order::review::ReviewOrderStoreAdminUserFactory'->new());
    $self->{SHIPPING} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{SHIPPING}, 'org::allbinary::business::user::modules::admin::store::order::ship::ShipOrderStoreAdminUserFactory'->new());
    $self->{ADJUSTER} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{ADJUSTER}, 'org::allbinary::business::user::modules::admin::store::order::adjust::AdjustOrderStoreAdminUserFactory'->new());
    $self->{WORKFLOWEDITOR} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{WORKFLOWEDITOR}, 'org::allbinary::business::user::modules::admin::store::web::workflow::editor::WorkflowEditorWebStoreAdminUserFactory'->new());
    $self->{WIZARD} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{WIZARD}, 'org::allbinary::business::user::modules::admin::store::web::wizard::WizardWebStoreAdminUserFactory'->new());
    $self->{VIEWEDITOR} = 'org::allbinary::business::user::role::UserRoleB'->new($self->{basicUserRoleFactory}->{VIEWEDITOR}, 'org::allbinary::business::user::modules::admin::store::web::view::editor::ViewEditorWebStoreAdminUserFactory'->new());
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::role::UserRoleFactory::instance;
}

use org::allbinary::business::user::modules::UserFactory;
use org::allbinary::business::user::modules::admin::AdminUserFactory;
use org::allbinary::business::user::modules::admin::store::StoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::customer::CustomerStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::order::OrderStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::order::adjust::AdjustOrderStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::order::review::ReviewOrderStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::order::ship::ShipOrderStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::payment::PaymentStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::product::ProductStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::web::WebStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::web::view::editor::ViewEditorWebStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::web::wizard::WizardWebStoreAdminUserFactory;
use org::allbinary::business::user::modules::admin::store::web::workflow::editor::WorkflowEditorWebStoreAdminUserFactory;
use org::allbinary::business::user::modules::customer::subscriber::SubscriberUserFactory;
use org::allbinary::business::user::modules::customer::wholesale::WholesaleUserFactory;
use org::allbinary::business::user::role::BasicUserRoleFactory;
use org::allbinary::business::user::role::UserRoleB;

1;

