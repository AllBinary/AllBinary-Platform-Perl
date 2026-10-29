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

package org::allbinary::business::user::commerce::inventory::item::BasicItemView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
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
        if ($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "toXmlNode");
        }
        my $hashMap = $self->{itemInterface}->toHashMap();
        my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        $hashMap->put($self->{basicItemData}->{IMAGE}, $EMPTY_STRING);
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $keySet = $hashMap->keySet();
        my $node = $document->createElement($self->{basicItemData}->{ITEM});
        my $nameArray = $keySet->toArray();
        my $size2 = scalar(@{$nameArray});
        for (my $index = 0; $index < $size2; $index++) {
            my $name = $nameArray->[$index];
            my $value = $hashMap->get($name);
            $value = $stringUtil->getNonNull($value);
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
        }
        my $totalNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $self->{basicItemData}->{TOTAL}, $self->{itemInterface}->getTotal()->toString());
        $node->appendChild($totalNode);
        my $size = $self->{vector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $domNodeInterface = $self->{vector}->get($index);
            my $customNode = $domNodeInterface->toXmlNode($document);
            $node->appendChild($customNode);
        }
        return $node;
}


sub toXmlDoc {
    my ($self) = @_;
        return undef;
}


sub view {
    my ($self) = @_;
        return undef;
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;

1;

