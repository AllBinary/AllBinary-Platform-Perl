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

package org::allbinary::dom::DomHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::dom::DomHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::dom::DomHelper::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub createDocument {
    my ($self) = @_;
        try {
            my $factory = 'javax::xml::parsers::DocumentBuilderFactory'->newInstance();
            my $builder = $factory->newDocumentBuilder();
            my $document = $builder->newDocument();
            return $document;
        } catch ($e) {
            return undef;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub createDocument {
    my ($self, $xmlFile) = @_;
        try {
            my $factory = 'javax::xml::parsers::DocumentBuilderFactory'->newInstance();
            my $builder = $factory->newDocumentBuilder();
            my $document = $builder->parse($xmlFile);
            return $document;
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub toString {
    my ($self, $document) = @_;
        try {
            my $domSource = 'javax::xml::transform::dom::DOMSource'->new($document);
            my $byteArrayOutputStream = 'java::io::ByteArrayOutputStream'->new();
            my $streamResult = 'javax::xml::transform::stream::StreamResult'->new($byteArrayOutputStream);
            my $copyTransformerFactory = 'javax::xml::transform::TransformerFactory'->newInstance();
            my $copyTransformer = $copyTransformerFactory->newTransformer();
            $copyTransformer->transform($domSource, $streamResult);
            return $byteArrayOutputStream->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub save {
    my ($self, $file, $document) = @_;
        try {
            my $copyTransformerFactory = 'javax::xml::transform::TransformerFactory'->newInstance();
            my $copyTransformer = $copyTransformerFactory->newTransformer();
            my $domSource = 'javax::xml::transform::dom::DOMSource'->new($document);
            $file->createNewFile();
            my $streamResult = 'javax::xml::transform::stream::StreamResult'->new($file);
            $copyTransformer->transform($domSource, $streamResult);
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub getChildNodeList {
    my ($self, $nodeName, $nodeList) = @_;
        my $numberOfNodes = $nodeList->getLength();
        for (my $index = 0; $index < $numberOfNodes; $index++) {
            my $node = $nodeList->item($index);
            if ($node->getNodeName()->compareTo($nodeName) == 0) {
                return $node->getChildNodes();
            }
        }
        die ($nodeName . " Node Not Found");
}


# throws Exception
sub getChildrenWithoutTextNodes {
    my ($self, $nodeName, $nodeList) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $childNodeList = $self->getChildNodeList($nodeName, $nodeList);
        my $numberOfChildren = $childNodeList->getLength();
        for (my $index = 0; $index < $numberOfChildren; $index++) {
            my $node = $childNodeList->item($index);
            if ($node->getNodeType() != $org::w3c::dom::Node::TEXT_NODE) {
                $list->add($node);
            }
        }
        return $list;
}


# throws Exception
sub getWithoutTextNodes {
    my ($self, $nodeList) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $numberOfChildren = $nodeList->getLength();
        for (my $index = 0; $index < $numberOfChildren; $index++) {
            my $node = $nodeList->item($index);
            if ($node->getNodeType() != $org::w3c::dom::Node::TEXT_NODE) {
                $list->add($node);
            }
        }
        return $list;
}


# throws Exception
sub searchNodeList {
    my ($self, $nodeName, $nodeList) = @_;
        my $numberOfNodes = $nodeList->getLength();
        for (my $index = 0; $index < $numberOfNodes; $index++) {
            my $node = $nodeList->item($index);
            $self->{logUtil}->putF("NodeName: " . $node->getNodeName(), $self, "searchNodeList");
            if ($node->getNodeName()->compareTo($nodeName) == 0) {
                return $node;
            }
        }
        die ($nodeName . " Node Not Found in search");
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub searchNodeList {
    my ($self, $nodeName, $nodeList) = @_;
        my $numberOfNodes = $nodeList->size();
        for (my $index = 0; $index < $numberOfNodes; $index++) {
            my $node = $nodeList->get($index);
            $self->{logUtil}->putF("NodeName: " . $node->getNodeName(), $self, "searchNodeList");
            if ($node->getNodeName()->compareTo($nodeName) == 0) {
                return $node;
            }
        }
        die ($nodeName . " Node Not Found in search");
}

# use java::io::ByteArrayOutputStream;
use java::io::File;
# use javax::xml::parsers::DocumentBuilder;
# use javax::xml::parsers::DocumentBuilderFactory;
# use javax::xml::transform::Transformer;
# use javax::xml::transform::TransformerFactory;
# use javax::xml::transform::dom::DOMSource;
# use javax::xml::transform::stream::StreamResult;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

