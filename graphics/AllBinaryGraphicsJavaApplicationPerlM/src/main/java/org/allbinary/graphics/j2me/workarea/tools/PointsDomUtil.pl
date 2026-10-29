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

package org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{LINES} = "lines";
    $self->{POINTONE} = "pointOne";
    $self->{POINTTWO} = "pointTwo";
    $self->{ROTATEDPOINTONE} = "rotatedPointOne";
    $self->{ROTATEDPOINTTWO} = "rotatedPointTwo";
    $self->{LINE} = "line";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil::instance;
}


# throws Exception
sub toDom {
    my ($self, $canvasDom, $pointVector) = @_;
        my $tempPointVector = 'org::allbinary::graphics::j2me::workarea::tools::PointsUtil'->getInstance()->doTransforms($pointVector, $canvasDom->getAngle(), 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($canvasDom->getDimension()->getWidth(), $canvasDom->getDimension()->getHeight()));
        my $document = 'org::allbinary::graphics::j2me::workarea::WorkAreaJPanel'->getDocument();
        my $linesNode = $document->createElement($self->{LINES});
        my $size2 = $tempPointVector->size();
        my $size = $pointVector->size();
        my $firstPoint = undef;
        my $rotatedFirstPoint = undef;
        my $index = 0;
        if ($index < $size && $index < $size2) {
            $rotatedFirstPoint = $tempPointVector->get($index);
            $firstPoint = $pointVector->get($index);
            $index++;
        }
        while ($index < $size && $index < $size2) {
            my $lineNode = $document->createElement($self->{LINE});
            my $rotatedSecondPoint = $tempPointVector->get($index);
            my $secondPoint = $pointVector->get($index);
            my $pointOneNode = $self->getPointNode($firstPoint, $self->{POINTONE});
            my $pointTwoNode = $self->getPointNode($secondPoint, $self->{POINTTWO});
            my $rotatedPointOneNode = $self->getPointNode($rotatedFirstPoint, $self->{ROTATEDPOINTONE});
            my $rotatedPointTwoNode = $self->getPointNode($rotatedSecondPoint, $self->{ROTATEDPOINTTWO});
            $lineNode->appendChild($pointOneNode);
            $lineNode->appendChild($pointTwoNode);
            $lineNode->appendChild($rotatedPointOneNode);
            $lineNode->appendChild($rotatedPointTwoNode);
            $firstPoint = $secondPoint;
            $rotatedFirstPoint = $rotatedSecondPoint;
            $linesNode->appendChild($lineNode);
            $index++;
        }
        return $linesNode;
}


sub getPointNode {
    my ($self, $point, $pointName) = @_;
        my $document = 'org::allbinary::graphics::j2me::workarea::WorkAreaJPanel'->getDocument();
        my $pointNode = $document->createElement($pointName);
        my $xNode = $document->createElement('org::allbinary::math::PositionStrings'->getInstance()->{X});
        my $xTextNode = $document->createTextNode(("" . ($point->getX())));
        $xNode->appendChild($xTextNode);
        my $yNode = $document->createElement('org::allbinary::math::PositionStrings'->getInstance()->{Y});
        my $yTextNode = $document->createTextNode(("" . ($point->getY())));
        $yNode->appendChild($yTextNode);
        $pointNode->appendChild($xNode);
        $pointNode->appendChild($yNode);
        return $pointNode;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanel;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasDom;
use org::allbinary::math::PositionStrings;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Node;
use org::allbinary::graphics::j2me::workarea::tools::PointsUtil;

1;

