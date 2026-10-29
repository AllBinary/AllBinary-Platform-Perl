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

package org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{storeFrontAdvertisementsStatisticsInterface} = undef;
}


sub new {
    my ($class, $storeFrontAdvertisementsStatisticsInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{storeFrontAdvertisementsStatisticsInterface} = $storeFrontAdvertisementsStatisticsInterface;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->{storeFrontAdvertisementsStatisticsInterface}->toHashMap();
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsData'->getInstance()->{NAME}, $hashMap);
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::context::modules::storefront::statistics::advertisements::StoreFrontAdvertisementsStatisticsData;

1;

