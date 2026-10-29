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

package org::allbinary::business::context::modules::storefront::statistics::RealTimeStoreFrontStatisticsView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{storeFrontStatisticsInterface} = undef;
    $self->{userRole} = undef;
}


sub new {
    my ($class, $storeFrontStatisticsInterface, $userRole) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{storeFrontStatisticsInterface} = $storeFrontStatisticsInterface;
        $self->{userRole} = $userRole;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement('org::allbinary::business::context::modules::storefront::statistics::StoreFrontStatisticsData'->getInstance()->{NAME});
        my $storeFrontAdvertisementsStatisticsInterface = $self->{storeFrontStatisticsInterface}->getAdvertisements();
        my $storeFrontAdvertisementsStatisticsDomNodeInterface = 'org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsView'->new($storeFrontAdvertisementsStatisticsInterface);
        $node->appendChild($storeFrontAdvertisementsStatisticsDomNodeInterface->toXmlNode($document));
        my $storeFrontInventoryStatisticsInterface = $self->{storeFrontStatisticsInterface}->getInventory();
        my $storeFrontInventoryStatisticsDomNodeInterface = 'org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsView'->new($storeFrontInventoryStatisticsInterface);
        $node->appendChild($storeFrontInventoryStatisticsDomNodeInterface->toXmlNode($document));
        my $storeFrontOrdersHistoryStatisticsInterface = $self->{storeFrontStatisticsInterface}->getOrders();
        my $storeFrontOrdersHistoryStatisticsDomNodeInterface = 'org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsView'->new($storeFrontOrdersHistoryStatisticsInterface);
        $node->appendChild($storeFrontOrdersHistoryStatisticsDomNodeInterface->toXmlNode($document));
        if ($self->{userRole} == 'org::allbinary::business::user::role::UserRoleFactory'->getInstance()->{ADMINISTRATOR}) {
            my $storeFrontUsersStatisticsInterface = $self->{storeFrontStatisticsInterface}->getUsers();
            my $storeFrontUsersStatisticsDomNodeInterface = 'org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsView'->new($storeFrontUsersStatisticsInterface);
            $node->appendChild($storeFrontUsersStatisticsDomNodeInterface->toXmlNode($document));
        }
        return $node;
}

use org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsView;
use org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::inventory::StoreFrontInventoryStatisticsView;
use org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsView;
use org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsView;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::business::user::role::UserRoleFactory;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::context::modules::storefront::statistics::StoreFrontStatisticsData;

1;

