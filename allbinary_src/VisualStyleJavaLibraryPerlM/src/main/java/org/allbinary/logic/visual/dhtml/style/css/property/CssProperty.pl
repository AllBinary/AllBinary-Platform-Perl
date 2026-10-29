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

package org::allbinary::logic::visual::dhtml::style::css::property::CssProperty;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{propertyName} = undef;
    $self->{cssPropertyValues} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CssProperty takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{propertyName} = $name;
        $self->{cssPropertyValues} = 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValues'->new();
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $propertyNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $node->getChildNodes());
        $self->{propertyName} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($propertyNode);
        if ($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{STYLE})) {
            $self->{logUtil}->putF("Name: " . $self->getName(), $self, "CssProperty()");
        }
        my $propertyValuesNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData'->getInstance()->{VALUES}, $node->getChildNodes());
        $self->{cssPropertyValues} = 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValues'->new($propertyValuesNode);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{propertyName};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put('org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData'->getInstance()->{NAME}, $self->{propertyName});
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMap();
        if ($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("CssView HashMap: " . $hashMap->toString(), $self, "toXmlNode()");
        }
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData'->getInstance()->{NAME}, $self->{propertyName});
        $node->appendChild($self->{cssPropertyValues}->toXmlNode($document));
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValues;
use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData;

1;

