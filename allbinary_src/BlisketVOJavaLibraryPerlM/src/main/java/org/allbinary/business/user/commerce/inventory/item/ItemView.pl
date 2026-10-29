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

package org::allbinary::business::user::commerce::inventory::item::ItemView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{itemInterface} = undef;
    $self->{vector} = undef;
}


sub new {
    my ($class, $itemInterface, $vector) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{itemInterface} = $itemInterface;
        $self->{vector} = $vector;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->{itemInterface}->toHashMap();
        my $keySet = $hashMap->keySet();
        my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::item::ItemData::ITEM);
        my $basicItemView = 'org::allbinary::business::user::commerce::inventory::item::BasicItemView'->new($self->{itemInterface}, $self->{vector});
        $node->appendChild($basicItemView->toXmlNode($document));
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $nameArray = $keySet->toArray();
        my $size = scalar(@{$nameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $name = $nameArray->[$index];
            my $value = $hashMap->get($name);
            $value = $stringUtil->getNonNull($value);
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
        }
        my $shippingAddressNode = $document->createElement($org::allbinary::business::user::address::StreetAddressData::NAME);
        $shippingAddressNode->appendChild($self->{itemInterface}->getShippingAddress()->toXmlNode($document));
        return $node;
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::string::StringUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::inventory::item::ItemData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemView;

1;

