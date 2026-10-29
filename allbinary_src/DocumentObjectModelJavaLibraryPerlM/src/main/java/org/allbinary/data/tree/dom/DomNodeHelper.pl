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

package org::allbinary::data::tree::dom::DomNodeHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getFirstChildElement {
    my ($class, $parentNode) = @_;
        my $node = $parentNode->getFirstChild();
        if (defined($node) && $node->getNodeType() != $org::w3c::dom::Node::ELEMENT_NODE) {
            my $nodeList = $parentNode->getChildNodes();
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                $node = $nodeList->item($index);
                if ($node->getNodeType() == 1) {
                    last;
                }
            }
        }
        return $node;
}


sub getTextNodeValue {
    my ($class, $node) = @_;
        my $nodeTextNode = $node->getFirstChild();
        if (defined($nodeTextNode)) {
            return $nodeTextNode->getNodeValue();
        } else {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getTextNodeValue {
    my ($class, $nodeName, $nodeList) = @_;
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($nodeName, $nodeList);
        return 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node);
}


sub getTextNodesValue {
    my ($class, $node) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $nodeList = $node->getChildNodes();
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $nodeTextNode = $nodeList->item($index);
            if ($nodeTextNode->getNodeType() == $org::w3c::dom::Node::TEXT_NODE) {
                if (defined($nodeTextNode)) {
                    $stringBuffer->append($nodeTextNode->getNodeValue());
                }
            }
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::data::tree::dom::DomSearchHelper;

1;

