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

package org::allbinary::graphics::j2me::workarea::canvas::CanvasDom;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $FRAME = "frame";
our $ROTATE = "rotate";
our $SIZE = "size";
our $X = "X";
our $Y = "Y";
our $ZOOM = "zoom";
our $GRID = "grid";
our $ENABLED = "enabled";
our $POSSIBLE = "possible";
our $GRAPHICITEMS = "graphicItems";
our $REAL_SIZE = "realSize";

sub _init_fields {
    my ($self) = @_;
    $self->{graphicsStrings} = 'org::allbinary::graphics::GraphicsStrings'->getInstance();
    $self->{graphicItemHashMap} = undef;
    $self->{angle} = undef;
    $self->{dimension} = undef;
    $self->{grid} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of CanvasDom takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $canvasNode) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{grid} = 'org::allbinary::graphics::j2me::workarea::canvas::Grid'->new();
        $self->{grid}->{grid} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY(0, 0);
        $self->{dimension} = 'org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension'->new(0, 0);
        my $name = $canvasNode->getNodeName();
        if (($name cmp $org::allbinary::graphics::j2me::workarea::canvas::CanvasDom::FRAME) == 0) {
            $self->{graphicItemHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $angleNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($ROTATE, $canvasNode->getChildNodes());
            my $angleTextNode = $angleNode->getFirstChild();
            my $angle = $angleTextNode->getNodeValue();
            $self->setAngle($angle);
            my $sizeNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($SIZE, $canvasNode->getChildNodes());
            my $xNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($X, $sizeNode->getChildNodes());
            my $xTextNode = $xNode->getFirstChild();
            my $x = int($xTextNode->getNodeValue());
            my $yNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($Y, $sizeNode->getChildNodes());
            my $yTextNode = $yNode->getFirstChild();
            my $y = int($yTextNode->getNodeValue());
            $self->setWorkArea($x, $y);
            my $zoomNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($ZOOM, $canvasNode->getChildNodes());
            my $zoomTextNode = $zoomNode->getFirstChild();
            $self->{grid}->setZoom(int($zoomTextNode->getNodeValue()));
            my $gridNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($GRID, $canvasNode->getChildNodes());
            my $gridSizeNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($SIZE, $gridNode->getChildNodes());
            my $gridXNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($X, $gridSizeNode->getChildNodes());
            my $gridXTextNode = $gridXNode->getFirstChild();
            my $gridX = int($gridXTextNode->getNodeValue());
            my $gridYNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($Y, $gridSizeNode->getChildNodes());
            my $gridYTextNode = $gridYNode->getFirstChild();
            my $gridY = int($gridYTextNode->getNodeValue());
            $self->setGrid($gridX, $gridY);
            my $enableNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($ENABLED, $gridNode->getChildNodes());
            my $enableTextNode = $enableNode->getFirstChild();
            $self->{grid}->showGrid($enableTextNode->getNodeValue());
            my $possibleNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList($POSSIBLE, $gridNode->getChildNodes());
            my $possibleTextNode = $possibleNode->getFirstChild();
            $self->{grid}->{isGridPossible} = $possibleTextNode->getNodeValue();
            my $graphicItemNodeList = 'org::allbinary::dom::DomHelper'->getInstance()->getChildrenWithoutTextNodes($GRAPHICITEMS, $canvasNode->getChildNodes());
            if (defined($graphicItemNodeList)) {
                $self->{graphicItemHashMap} = 'org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory'->getInstance()->getInstance($graphicItemNodeList);
            }
        } else {
            die ("Frame Element Not Found but Found: " . $name);
        }
    return $self;
}


sub _new1 {
    my ($class, $canvasJPanel) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{angle} = $canvasJPanel->getAngle();
        $self->{graphicItemHashMap} = $canvasJPanel->getGraphicItemHashMap();
        $self->{dimension} = $canvasJPanel->getCanvasDimension();
        $self->{grid} = 'org::allbinary::graphics::j2me::workarea::canvas::Grid'->new($canvasJPanel->getGrid());
        $self->{angle} = $canvasJPanel->getAngle();
    return $self;
}


sub getAngle {
    my ($self) = @_;
        return $self->{angle};
}


sub getGraphicItemHashMap {
    my ($self) = @_;
        return $self->{graphicItemHashMap};
}


sub setAngle {
    my ($self, $angle) = @_;
        $self->{angle} = $angle;
}


# throws Exception
sub setWorkArea {
    my ($self, $x, $y) = @_;
        $self->setDimension('org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension'->new($x, $y));
}


# throws Exception
sub setGrid {
    my ($self, $gridX, $gridY) = @_;
        $self->{grid}->{grid} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($gridX, $gridY);
}


sub getPointNode {
    my ($self, $point, $pointName) = @_;
        my $document = 'org::allbinary::graphics::j2me::workarea::WorkAreaJPanel'->getDocument();
        my $pointNode = $document->createElement($pointName);
        my $xNode = $document->createElement($X);
        my $xTextNode = $document->createTextNode(("" . ($point->getX())));
        $xNode->appendChild($xTextNode);
        my $yNode = $document->createElement($Y);
        my $yTextNode = $document->createTextNode(("" . ($point->getY())));
        $yNode->appendChild($yTextNode);
        $pointNode->appendChild($xNode);
        $pointNode->appendChild($yNode);
        return $pointNode;
}


# throws Exception
sub toDom {
    my ($self) = @_;
        my $document = 'org::allbinary::graphics::j2me::workarea::WorkAreaJPanel'->getDocument();
        my $frameNode = $document->createElement($FRAME);
        my $angleNode = $document->createElement($ROTATE);
        my $angleTextNode = $document->createTextNode($self->getAngle()->toString());
        $angleNode->appendChild($angleTextNode);
        my $sizeNode = $self->getPointNode('org::allbinary::graphics::PointFactory'->getInstance()->createXY($self->getDimension()->getWidth(), $self->getDimension()->getHeight()), $SIZE);
        my $zoomNode = $document->createElement($ZOOM);
        my $zoomTextNode = $document->createTextNode($self->getGrid()->getZoom()->toString());
        $zoomNode->appendChild($zoomTextNode);
        my $gridNode = $document->createElement($GRID);
        my $gridSizeNode = $self->getPointNode($self->getGrid()->{grid}, $SIZE);
        $gridNode->appendChild($gridSizeNode);
        my $enableNode = $document->createElement($ENABLED);
        my $enableTextNode = $document->createTextNode($self->getGrid()->isGridOn()->toString());
        $enableNode->appendChild($enableTextNode);
        $gridNode->appendChild($enableNode);
        my $possibleNode = $document->createElement($POSSIBLE);
        my $possibleTextNode = $document->createTextNode($self->getGrid()->isGridPossible()->toString());
        $possibleNode->appendChild($possibleTextNode);
        $gridNode->appendChild($possibleNode);
        my $realSizeNode = $document->createElement($REAL_SIZE);
        my $vectorCenterGenerator = 'org::allbinary::animation::vector::VectorCenterGenerator'->new();
        $vectorCenterGenerator->calculate($self->getGraphicItemHashMap());
        my $widthNode = $document->createElement($self->{graphicsStrings}->{WIDTH});
        my $widthTextNode = $document->createTextNode(("" . ($vectorCenterGenerator->getWidth())));
        $widthNode->appendChild($widthTextNode);
        $realSizeNode->appendChild($widthNode);
        my $heightNode = $document->createElement($self->{graphicsStrings}->{HEIGHT});
        my $heightTextNode = $document->createTextNode(("" . ($vectorCenterGenerator->getHeight())));
        $heightNode->appendChild($heightTextNode);
        $realSizeNode->appendChild($heightNode);
        $frameNode->appendChild($angleNode);
        $frameNode->appendChild($sizeNode);
        $frameNode->appendChild($zoomNode);
        $frameNode->appendChild($gridNode);
        $frameNode->appendChild($realSizeNode);
        my $graphicItemNode = $document->createElement($GRAPHICITEMS);
        my $graphicItemArray = $self->getGraphicItemHashMap()->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $self->{graphicItemHashMap}->get($graphicItemArray->[$index]);
            if ($item->getName() eq 'org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->getStaticName()) {
                if ($item->isValid()) {
                    $graphicItemNode->appendChild($item->toDom($self));
                }
            }
        }
        $frameNode->appendChild($graphicItemNode);
        return $frameNode;
}


sub getDimension {
    my ($self) = @_;
        return $self->{dimension};
}


sub setDimension {
    my ($self, $dimension) = @_;
        $self->{dimension} = $dimension;
}


sub getGrid {
    my ($self) = @_;
        return $self->{grid};
}

use java::util::HashMap;
use org::allbinary::animation::vector::VectorCenterGenerator;
use org::allbinary::dom::DomHelper;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::GraphicsStrings;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanel;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface;
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Node;
use org::allbinary::graphics::j2me::workarea::canvas::Grid;
use org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension;

1;

