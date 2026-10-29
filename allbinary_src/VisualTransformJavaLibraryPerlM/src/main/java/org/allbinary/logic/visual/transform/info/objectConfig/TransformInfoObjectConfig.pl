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

package org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{ownerTransformInfoInterface} = undef;
    $self->{document} = undef;
    $self->{outputTypeName} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of TransformInfoObjectConfig takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{ownerTransformInfoInterface} = $transformInfoInterface;
        $self->createDocument();
        if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("TransformInfo: ");
            if (defined($self->{ownerTransformInfoInterface})) {
                $stringBuffer->append($self->{ownerTransformInfoInterface}->getName());
            } else {
                $stringBuffer->append("No Owner!?#\@");
            }
            $stringBuffer->append("\nConstructed with document: ");
            $stringBuffer->append($self->toString());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "Constructor(TransformInfoInterface)");
        }
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $document) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{ownerTransformInfoInterface} = $transformInfoInterface;
        $self->{document} = $document;
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow('org::allbinary::logic::io::OutputTypeData'->getInstance()->{NAME}, $self->getRootNode()->getChildNodes());
        if (defined($node)) {
            $self->setOutputTypeName('org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node));
        }
        if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("TransformInfo: ");
            if (defined($self->{ownerTransformInfoInterface})) {
                $stringBuffer->append($self->{ownerTransformInfoInterface}->getName());
            } else {
                $stringBuffer->append("No Owner!?#\@");
            }
            $stringBuffer->append("\nConstructed with document: ");
            $stringBuffer->append($self->toString());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "Constructor(TransformInfoInterface, Document)");
        }
    return $self;
}


sub _new3 {
    my ($class, $transformInfoInterface, $name, $type) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{ownerTransformInfoInterface} = $transformInfoInterface;
        $self->createDocument();
        my $configNameAttr = $self->{document}->createAttribute('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME});
        $configNameAttr->setValue($name);
        my $objectConfigNode = $self->{document}->getElementsByTagName('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME})->item(0);
        $objectConfigNode->appendChild($configNameAttr);
        if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("TransformInfo: ");
            if (defined($self->{ownerTransformInfoInterface})) {
                $stringBuffer->append($self->{ownerTransformInfoInterface}->getName());
            } else {
                $stringBuffer->append("No Owner!?#\@");
            }
            $stringBuffer->append("\nConstructed with document: ");
            $stringBuffer->append($self->toString());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "Constructor(TransformInfoInterface, name, type)");
        }
    return $self;
}


sub createDocument {
    my ($self) = @_;
        $self->{document} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        my $objectConfigNode = $self->{document}->createElement('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME});
        $self->{document}->appendChild($objectConfigNode);
}


sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{ownerTransformInfoInterface};
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        return $self->{document};
}


sub setDocument {
    my ($self, $document) = @_;
        $self->{document} = $document;
}


sub containsView {
    my ($self, $transformInfoInterface) = @_;
        my $objectConfigNode = $self->{document}->getElementsByTagName('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME})->item(0);
        my $viewNodeList = $objectConfigNode->getChildNodes();
        my $numberOfViews = $viewNodeList->getLength();
        for (my $index = 0; $index < $numberOfViews; $index++) {
            my $viewNode = $viewNodeList->item($index);
            my $viewAttributes = $viewNode->getAttributes();
            my $attrNode = $viewAttributes->getNamedItem('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME});
            if ($transformInfoInterface->getName()->compareTo($attrNode->getValue()) == 0) {
                return 1;
            }
        }
        return 0;
}


# throws Exception
sub getTemplateAttributes {
    my ($self) = @_;
        my $componentNode = $self->{document}->getElementsByTagName('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME})->item(0);
        return $componentNode->getAttributes();
}


# throws Exception
sub getName {
    my ($self) = @_;
        my $attrNode = $self->getTemplateAttributes()->getNamedItem('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME});
        return $attrNode->getValue();
}


# throws Exception
sub setName {
    my ($self, $name) = @_;
        my $attrNode = $self->getTemplateAttributes()->getNamedItem('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME});
        $attrNode->setValue($name);
}


# throws Exception
sub getNodeVector {
    my ($self, $nodeName) = @_;
        my $componentsNodeList = $self->{document}->getElementsByTagName($nodeName);
        if (defined($componentsNodeList) && $componentsNodeList->getLength() > 0) {
            my $viewNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, $componentsNodeList->item(0)->getChildNodes());
            my $numberOfViews = $viewNodeVector->size();
            if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Number Of ");
                $stringBuffer->append($nodeName);
                $stringBuffer->append(" Nodes: ");
                $stringBuffer->appendint($numberOfViews);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "getNodeVector(nodename)");
            }
            return $viewNodeVector;
        }
        return 'org::allbinary::util::BasicArrayListD'->new();
}


# throws Exception
sub getTransformDomNodes {
    my ($self, $nodeName) = @_;
        my $viewVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $viewNodeVector = $self->getNodeVector($nodeName);
        my $size = $viewNodeVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $viewNode = $viewNodeVector->get($index);
            $viewVector->add('org::allbinary::logic::visual::transform::info::TransformInfoDomNode'->new($viewNode));
        }
        return $viewVector;
}


# throws Exception
sub getTransforms {
    my ($self, $nodeName) = @_;
        my $viewVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $viewNodeVector = $self->getNodeVector($nodeName);
        my $size = $viewNodeVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $viewNode = $viewNodeVector->get($index);
            $viewVector->add('org::allbinary::logic::visual::transform::info::TransformInfoDomNode'->new($viewNode)->getTransformInfoInterface());
        }
        return $viewVector;
}


# throws Exception
sub getTransformsGroup {
    my ($self, $group) = @_;
        if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Started: " . $group, $self, "getTransformsGroup()");
        }
        my $viewVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $GROUP = 'org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{GROUP};
        my $componentsNodeList = $self->{document}->getElementsByTagName($GROUP);
        if (defined($componentsNodeList) && $componentsNodeList->getLength() > 0) {
            my $componentsNode = $componentsNodeList->item(0);
            my $length = $componentsNodeList->getLength();
            for (my $index = 0; $index < $length; $index++) {
                my $node = $componentsNodeList->item($index);
                my $attributes = $node->getAttributes();
                my $attrNode = $attributes->getNamedItem($GROUP);
                my $value = $attrNode->getValue();
                if (($value cmp $group) == 0) {
                    $componentsNode = $node;
                    last;
                }
            }
            my $viewNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, $componentsNode->getChildNodes());
            my $numberOfViews = $viewNodeVector->size();
            if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Number Of Nodes: " . $numberOfViews, $self, "getTransformsGroup()");
            }
            my $size = $viewNodeVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $viewNode = $viewNodeVector->get($index);
                $viewVector->add('org::allbinary::logic::visual::transform::info::TransformInfoDomNode'->new($viewNode));
            }
        } else {
            if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                if (!defined($componentsNodeList)) {
                    $self->{logUtil}->putF("Number Of Nodes: NULL", $self, "getTransformsGroup()");
                } else {
                    $self->{logUtil}->putF("Number Of Nodes: 0", $self, "getTransformsGroup()");
                }
            }
        }
        return $viewVector;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getTransformDomNodes {
    my ($self) = @_;
        return $self->getTransformDomNodes('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{GROUP});
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getTransforms {
    my ($self) = @_;
        return $self->getTransforms('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{NAME});
}


# throws Exception
sub getGroupTransforms {
    my ($self) = @_;
        return $self->getTransforms('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{GROUP});
}


# throws Exception
sub getParentTransforms {
    my ($self) = @_;
        return $self->getTransforms('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{PARENT});
}


sub getRootNode {
    my ($self) = @_;
        return $self->{document}->getElementsByTagName('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME})->item(0);
}


sub setOutputTypeName {
    my ($self, $outputTypeName) = @_;
        $self->{outputTypeName} = $outputTypeName;
}


# throws Exception
sub getOutputTypeName {
    my ($self) = @_;
        return $self->{outputTypeName};
}


# throws Exception
sub getInputOutputTypeName {
    my ($self) = @_;
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{NAME}, $self->getRootNode()->getChildNodes());
        return 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node);
}


# throws Exception
sub getInputOutputTypeFile {
    my ($self) = @_;
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{FILE}, $self->getRootNode()->getChildNodes());
        return 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node);
}


# throws Exception
sub getImportUriPath {
    my ($self) = @_;
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::transform::template::XslData'->getInstance()->{ROOT_IMPORT_URI}, $self->getRootNode()->getChildNodes());
        return 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node);
}


sub toString {
    my ($self) = @_;
        try {
            if (defined($self->{document})) {
                return 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->{document});
            } else {
                return undef;
            }
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->putF("DOM Document error", $self, $self->{commonStrings}->{TOSTRING});
            }
            return undef;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::InputOutputTypeData;
use org::allbinary::logic::io::OutputTypeData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoDomNode;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfosData;
use org::allbinary::logic::visual::transform::template::XslData;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Attr;
use org::w3c::dom::Document;
use org::w3c::dom::NamedNodeMap;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;

1;

