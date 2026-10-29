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

package org::allbinary::logic::visual::transform::info::TransformInfoPropertiesFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::info::TransformInfoPropertiesFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::TransformInfoPropertiesFactory::instance;
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
    my ($self, $node) = @_;
        my $transformInfoChildNodeList = $node->getChildNodes();
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        my $attributes = $node->getAttributes();
        my $attrNode = $attributes->getNamedItem($transformInfoData->{NAME});
        my $name = $attrNode->getValue();
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{NEXT} . " View Name: " . $name, $self, "toTransformInfoPropertiesHashMap()");
        }
        my $labelNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($transformInfoData->{LABEL}, $transformInfoChildNodeList);
        my $label = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodesValue($labelNode);
        if (!defined($label)) {
            $label = $name;
        }
        my $descriptionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{DESCRIPTION}, $transformInfoChildNodeList);
        my $description = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodesValue($descriptionNode);
        my $objectFileNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{OBJECTFILENAME}, $transformInfoChildNodeList);
        my $objectFileName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($objectFileNode);
        my $objectConfigFileNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{OBJECTCONFIGFILENAME}, $transformInfoChildNodeList);
        my $objectConfigFileName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($objectConfigFileNode);
        my $templateFileNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{TEMPLATEFILENAME}, $transformInfoChildNodeList);
        my $templateFileName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($templateFileNode);
        my $transformInfoProperties = 'org::allbinary::logic::visual::transform::info::TransformInfoProperties'->new($name, $label, $description, $objectFileName, $objectConfigFileName, $templateFileName);
        return $transformInfoProperties;
}

use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::w3c::dom::Attr;
use org::w3c::dom::NamedNodeMap;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoProperties;

1;

