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

package org::allbinary::logic::visual::dhtml::style::css::CssElementView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{TITLE} = "title";
    $self->{DESCRIPTION} = "description";
    $self->{value} = undef;
    $self->{title} = undef;
    $self->{description} = undef;
    $self->{cssElementVector} = undef;
    $self->{cssPropertyVector} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CssElementView takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{cssPropertyVector} = 'org::allbinary::util::BasicArrayListD'->new();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->{title} = $stringUtil->{EMPTY_STRING};
        $self->{description} = $stringUtil->{EMPTY_STRING};
        $self->{value} = $stringUtil->{EMPTY_STRING};
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            my $valueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $node->getChildNodes());
            $self->{value} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($valueNode);
            my $titleValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($self->{TITLE}, $node->getChildNodes());
            if (defined($titleValueNode)) {
                $self->{title} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($titleValueNode);
            } else {
                my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
                $self->{title} = $stringUtil->{EMPTY_STRING};
            }
            my $descriptionValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($self->{DESCRIPTION}, $node->getChildNodes());
            if (defined($descriptionValueNode)) {
                $self->{description} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($descriptionValueNode);
            } else {
                $self->{description} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            }
            if ($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Value: ")->append($self->{value})->append("\nTitle: ")->append($self->{title})->append("\nDescription: ")->append($self->{description})->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
            }
            my $cssElementStyleNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::visual::dhtml::style::css::CssElementData'->getInstance()->{NAME}, $node->getChildNodes());
            if ($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Child Css Elements: " . $cssElementStyleNodeVector->size(), $self, "CssElementView()");
            }
            $self->{cssElementVector} = 'org::allbinary::logic::visual::dhtml::style::css::CssElementsValidationFactory'->getInstance($cssElementStyleNodeVector);
            my $nodeList = $node->getChildNodes();
            $self->{cssPropertyVector} = 'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertiesValidationFactory'->getInstance($nodeList);
        } catch ($e) {
            if ($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put('org::allbinary::logic::string::StringMaker'->new()->append("Value: ")->append($self->{value})->append("\nTitle: ")->append($self->{title})->append("\nDescription: ")->append($self->{description})->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            }
            die ("CssElementView");
        }
    return $self;
}


sub getValue {
    my ($self) = @_;
        return $self->{value};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::data::tree::dom::DomData::VALUE, $self->{value});
        $hashMap->put($self->{TITLE}, $self->{title});
        $hashMap->put($self->{DESCRIPTION}, $self->{description});
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMap();
        if ($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::css::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("CssView HashMap: " . $hashMap->toString(), $self, "toXmlNode");
        }
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, 'org::allbinary::logic::visual::dhtml::style::css::CssElementData'->getInstance()->{NAME}, $hashMap);
        my $size = $self->{cssPropertyVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $cssPropertyDomNodeInterface = $self->{cssPropertyVector}->get($index);
            $node->appendChild($cssPropertyDomNodeInterface->toXmlNode($document));
        }
        my $size2 = $self->{cssElementVector}->size();
        for (my $index = 0; $index < $size2; $index++) {
            my $cssElementDomNodeInterface = $self->{cssElementVector}->get($index);
            $node->appendChild($cssElementDomNodeInterface->toXmlNode($document));
        }
        return $node;
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
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertiesValidationFactory;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::visual::dhtml::style::css::CssElementData;
use org::allbinary::logic::visual::dhtml::style::css::CssElementsValidationFactory;

1;

