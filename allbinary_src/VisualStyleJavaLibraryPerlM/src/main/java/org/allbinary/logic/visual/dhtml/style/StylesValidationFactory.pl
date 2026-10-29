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

package org::allbinary::logic::visual::dhtml::style::StylesValidationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::dhtml::style::StylesValidationFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::dhtml::style::StylesValidationFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $document) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $nodeList = $document->getElementsByTagName('org::allbinary::logic::visual::dhtml::style::StylesData'->getInstance()->{NAME});
        if ($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Style Present: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document), $self, $commonStrings->{GET_INSTANCE});
        }
        if ($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Styles Present: " . $nodeList->getLength(), $self, $commonStrings->{GET_INSTANCE});
        }
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $stylesNode = $nodeList->item($index);
            my $styleNodeList = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::visual::dhtml::style::StyleData'->getInstance()->{NAME}, $stylesNode->getChildNodes());
            if ($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Number Of Style Nodes Present: " . $styleNodeList->size(), $self, $commonStrings->{GET_INSTANCE});
            }
            for (my $styleNodesIndex = 0; $styleNodesIndex < $styleNodeList->size(); $styleNodesIndex++) {
                my $styleNode = $styleNodeList->get($styleNodesIndex);
                my $cssElementStyleNodeList = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::visual::dhtml::style::css::CssElementData'->getInstance()->{NAME}, $styleNode->getChildNodes());
                if ($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Number Of Element Nodes Present: " . $cssElementStyleNodeList->size(), $self, $commonStrings->{GET_INSTANCE});
                }
                return 'org::allbinary::logic::visual::dhtml::style::css::CssElementsValidationFactory'->getInstance($cssElementStyleNodeList);
            }
        }
        if ($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::dhtml::style::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("No Style Present", $self, $commonStrings->{GET_INSTANCE});
        }
        return 'org::allbinary::util::BasicArrayListD'->new();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $hashMap) = @_;
        my $stylesDocument = $hashMap->get($org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::DOCUMENT);
        return 'org::allbinary::logic::visual::dhtml::style::StylesValidationFactory'->getInstance()->getInstance($stylesDocument);
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::http::request::NameSpaceRequestParamData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::dhtml::style::css::CssElementData;
use org::allbinary::logic::visual::dhtml::style::css::CssElementsValidationFactory;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::visual::dhtml::style::StylesData;
use org::allbinary::logic::visual::dhtml::style::StyleData;

1;

