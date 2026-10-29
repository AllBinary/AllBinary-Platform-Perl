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

package org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValues;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{propertyValueVector} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CssPropertyValues takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{propertyValueVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $indexPropertyValueHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{propertyValueVector} = 'org::allbinary::util::BasicArrayListD'->new();
        my $cssPropertyNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValueData'->getInstance()->{NAME}, $node->getChildNodes());
        if ($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{STYLE})) {
            $self->{logUtil}->putF("Number Of Properties: " . $cssPropertyNodeVector->size(), $self, "CssProperties()");
        }
        my $size = $cssPropertyNodeVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $cssPropertyValueNode = $cssPropertyNodeVector->get($index);
            my $valueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $cssPropertyValueNode->getChildNodes());
            my $propertyValue = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($valueNode);
            if ($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{STYLE})) {
                $self->{logUtil}->putF("Property Value: " . $propertyValue, $self, "CssProperties()");
            }
            my $indexNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::INDEX, $cssPropertyValueNode->getChildNodes());
            my $indexValue = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($indexNode);
            $indexPropertyValueHashMap->put($indexValue, $propertyValue);
        }
        my $size2 = $indexPropertyValueHashMap->keySet()->size();
        for (my $index = 0; $index < $size2; $index++) {
            my $indexInt = $index;
            my $propertyValue = $indexPropertyValueHashMap->get(("" . ($indexInt)));
            $self->{propertyValueVector}->add($propertyValue);
        }
    return $self;
}


sub toHashMap {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $cssPropertyValueData = 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValueData'->getInstance();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = $self->{propertyValueVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $value = $self->{propertyValueVector}->get($index);
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($cssPropertyValueData->{NAME});
            $stringBuffer->append($commonSeps->{BRACKET_OPEN});
            $stringBuffer->appendint($index);
            $stringBuffer->append($commonSeps->{BRACKET_CLOSE});
            $hashMap->put($stringBuffer->toString(), $value);
            $index++;
        }
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        if ($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::property::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $hashMap = $self->toHashMap();
            $self->{logUtil}->putF("CssPropertyValues HashMap: " . $hashMap->toString(), $self, "toXmlNode()");
        }
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueIndexNodes($document, 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData'->getInstance()->{VALUES}, 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValueData'->getInstance()->{NAME}, $self->{propertyValueVector});
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyValueData;
use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyData;

1;

