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

package org::allbinary::logic::visual::transform::info::TransformInfoDomNode;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{transformInfoInterface} = undef;
    $self->{mappedName} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of TransformInfoDomNode takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Constructing TransformInfo From TransformInfoDomNode: " . $node->getNodeName(), $self, "TransformInfoDomNode(Node node)");
        }
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        my $attributes = $node->getAttributes();
        my $attrNode = $attributes->getNamedItem($transformInfoData->{NAME});
        my $name = $attrNode->getValue();
        my $nodeList = $node->getChildNodes();
        if ($nodeList->getLength() > 1) {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Constructing Complete TransformInfo Node For: ");
                $stringBuffer->append($name);
                $stringBuffer->append(" with ");
                $stringBuffer->appendint(int($nodeList->getLength()));
                $stringBuffer->append(" children");
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "TransformInfoObjectConfigComponent(Node node)");
            }
            my $objectFileNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{OBJECTFILENAME}, $nodeList);
            my $objectFileName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($objectFileNameNode);
            my $objectConfigFileNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{OBJECTCONFIGFILENAME}, $nodeList);
            my $objectConfigFileName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($objectConfigFileNameNode);
            my $templateFileNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{TEMPLATEFILENAME}, $nodeList);
            my $templateFileName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($templateFileNameNode);
            my $dataFileNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($transformInfoData->{DATAFILENAME}, $nodeList);
            my $dataFileName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($dataFileNameNode);
            $self->{transformInfoInterface} = 'org::allbinary::logic::visual::transform::info::TransformInfo'->new($name, $objectFileName, $objectConfigFileName, $templateFileName, $dataFileName);
        } else {
            if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Constructing Partial TransformInfo Node For: ");
                $stringBuffer->append($name);
                $stringBuffer->append(" with ");
                $stringBuffer->appendint(int($nodeList->getLength()));
                $stringBuffer->append(" children");
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "TransformInfoObjectConfigComponent(Node node)");
            }
            $self->{transformInfoInterface} = 'org::allbinary::logic::visual::transform::info::TransformInfo'->new($name);
        }
        my $templateAttrNode = $attributes->getNamedItem($transformInfoData->{MAPPED});
        if (defined($templateAttrNode)) {
            $self->{mappedName} = $templateAttrNode->getValue();
        } else {
            $self->{mappedName} = $self->getTransformInfoInterface()->getName();
        }
    return $self;
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{mappedName} = $transformInfoInterface->getName();
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $mappedName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{mappedName} = $mappedName;
    return $self;
}


sub _new2 {
    my ($class, $name, $mappedName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{transformInfoInterface} = 'org::allbinary::logic::visual::transform::info::TransformInfo'->new($name);
        $self->{mappedName} = $mappedName;
    return $self;
}


sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{transformInfoInterface};
}


sub getMappedName {
    my ($self) = @_;
        return $self->{mappedName};
}


sub getReplaceKey {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("<transform:component name=\"");
        $stringBuffer->append("body");
        $stringBuffer->append("\"/>");
        my $key = $stringBuffer->toString();
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Component Key: " . $key, $self, "getReplaceKey()");
        }
        return $key;
}

use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::w3c::dom::Attr;
use org::w3c::dom::NamedNodeMap;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfo;

1;

