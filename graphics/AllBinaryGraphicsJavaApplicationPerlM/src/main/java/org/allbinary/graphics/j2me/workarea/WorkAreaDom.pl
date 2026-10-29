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

package org::allbinary::graphics::j2me::workarea::WorkAreaDom;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $WORKAREA = "workArea";
our $NAME = "name";
our $FRAMES = "frames";

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{canvasNodeList} = undef;
}


sub new {
    my ($class, $document) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $workAreaNodeList = $document->getElementsByTagName($WORKAREA);
        if (defined($workAreaNodeList)) {
            my $numberOfworkAreas = $workAreaNodeList->getLength();
            if ($numberOfworkAreas == 1) {
                my $numberOfNodes = $workAreaNodeList->getLength();
                my $nameNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($NAME, $workAreaNodeList->item(0)->getChildNodes());
                my $nameTextNode = $nameNode->getFirstChild();
                $self->{name} = $nameTextNode->getNodeValue();
            } else {
                die ("Wrong Number of WorkAreas: " . $numberOfworkAreas);
            }
            $self->{canvasNodeList} = 'org::allbinary::dom::DomHelper'->getInstance()->getChildrenWithoutTextNodes($org::allbinary::graphics::j2me::workarea::WorkAreaDom::FRAMES, $workAreaNodeList->item(0)->getChildNodes());
        } else {
            die ("workArea Node Not Found");
        }
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getCanvasNodes {
    my ($self) = @_;
        return $self->{canvasNodeList};
}

use org::allbinary::dom::DomHelper;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

