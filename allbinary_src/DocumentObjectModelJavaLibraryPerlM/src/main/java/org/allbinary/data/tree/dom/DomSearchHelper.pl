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

package org::allbinary::data::tree::dom::DomSearchHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getNodeNoThrow {
    my ($class, $nodeName, $nodeList) = @_;
        my $numberOfNodes = $nodeList->getLength();
        for (my $index = 0; $index < $numberOfNodes; $index++) {
            my $node = $nodeList->item($index);
            if ($node->getNodeName()->compareTo($nodeName) == 0) {
                return $node;
            }
        }
        return undef;
}


# throws Exception
sub getNode {
    my ($class, $nodeName, $nodeList) = @_;
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($nodeName, $nodeList);
        if (defined($node)) {
            return $node;
        } else {
            die ($nodeName . " Node Not Found in search");
        }
}


# throws Exception
sub getChildNodeList {
    my ($class, $nodeName, $nodeList) = @_;
        my $node = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($nodeName, $nodeList);
        return $node->getChildNodes();
}


# throws Exception
sub getAllNodes {
    my ($class, $nodeName, $nodeList) = @_;
        my $vector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodesNoThrow($nodeName, $nodeList);
        if (!defined($vector)) {
            die ($nodeName . " Node Not Found in search");
        } else {
            return $vector;
        }
}


sub getAllNodesNoThrow {
    my ($class, $nodeName, $nodeList) = @_;
        my $nodeVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $numberOfNodes = $nodeList->getLength();
        for (my $index = 0; $index < $numberOfNodes; $index++) {
            my $node = $nodeList->item($index);
            if ($node->getNodeName()->compareTo($nodeName) == 0) {
                $nodeVector->add($node);
            }
        }
        return $nodeVector;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

