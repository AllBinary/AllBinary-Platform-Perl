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

package org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use parent -norequire,'org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface';

our $RECT = "rect";
our $ARC = "arc";
our $STRING = "string";
our $CHAR = "char";
our $IMAGE = "image";
our $item = 0;
our $NAME = "Line Tool";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{gameInputStrings} = 'org::allbinary::game::input::GameInputStrings'->getInstance();
    $self->{treeNode} = undef;
    $self->{pointTreeNodeVector} = undef;
    $self->{currentMousePoint} = undef;
    $self->{fulcrumPoint} = undef;
    $self->{active} = 0;
    $self->{theta} = 0.0;
    $self->{color} = 'org::allbinary::graphics::j2me::workarea::tools::Color'->new(int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}));
    $self->{points} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of LinesGraphicItem takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{points} = 'org::allbinary::graphics::j2me::workarea::tools::Points'->new();
        try {
            $self->init();
            $self->{active} = 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub _new1 {
    my ($class, $linesNode) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{points} = 'org::allbinary::graphics::j2me::workarea::tools::Points'->new();
        $self->init();
        $self->{active} = 0;
        my $lineNodes = 'org::allbinary::dom::DomHelper'->getInstance()->getWithoutTextNodes($linesNode->getChildNodes());
        my $numberOfLines = $lineNodes->size();
        for (my $index = 0; $index < $numberOfLines; $index++) {
            my $lineNode = $lineNodes->get($index);
            my $pointNodes = 'org::allbinary::dom::DomHelper'->getInstance()->getWithoutTextNodes($lineNode->getChildNodes());
            my $pointOneNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList('org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil'->getInstance()->{POINTONE}, $pointNodes);
            $self->addPoint($pointOneNode->getChildNodes());
            if ($index == $numberOfLines - 1) {
                my $pointTwoNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList('org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil'->getInstance()->{POINTTWO}, $pointNodes);
                $self->addPoint($pointTwoNode->getChildNodes());
            }
        }
        if ($numberOfLines == 0) {
            die ("Lines node does not contain a line");
        }
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        $self->{treeNode} = 'javax::swing::tree::DefaultMutableTreeNode'->new('org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil'->getInstance()->{LINES} + $org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem::item);
        $org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem::item++;
        $self->{points}->init();
        $self->{pointTreeNodeVector} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{fulcrumPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY(0, 0);
}


# throws Exception
sub translate {
    my ($self, $x, $y) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Translating: " . $self->{points}->getPoints());
        my $basicGraphicsPipeline = 'org::allbinary::graphics::pipeline::BasicGraphicsPipeline'->new($self->{points}->getPoints());
        $basicGraphicsPipeline->translate($x, $y);
        $self->{points} = 'org::allbinary::graphics::j2me::workarea::tools::Points'->new();
        $self->{points}->addPoints($basicGraphicsPipeline->getMatrix());
}


sub setRotate {
    my ($self, $theta) = @_;
        while ($theta > 2 * $Math::PI) {
            $theta -= 2 * $Math::PI;
        }
        while ($theta < 0.0) {
            $theta += 2 * $Math::PI;
        }
        $self->{theta} = $theta;
}


sub addRotate {
    my ($self, $theta) = @_;
        $self->setRotate($self->{theta} + $theta);
}


sub setAngle {
    my ($self, $angle) = @_;
        $self->setRotate((($angle) * 3.14159265358979 / 180));
}


sub addAngle {
    my ($self, $angle) = @_;
        $self->setRotate($self->{theta} + (($angle) * 3.14159265358979 / 180));
}


sub getTreeNode {
    my ($self) = @_;
        return $self->{treeNode};
}


sub getName {
    my ($self) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem::NAME;
}


sub getStaticName {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem::NAME;
}


# throws Exception
sub addPoint {
    my ($self, $pointNodes) = @_;
        my $list = 'org::allbinary::dom::DomHelper'->getInstance()->getWithoutTextNodes($pointNodes);
        my $xNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList('org::allbinary::math::PositionStrings'->getInstance()->{X}, $list);
        my $xTextNode = $xNode->getFirstChild();
        my $xInteger = $xTextNode->getNodeValue();
        my $yNode = 'org::allbinary::dom::DomHelper'->getInstance()->searchNodeList('org::allbinary::math::PositionStrings'->getInstance()->{Y}, $list);
        my $yTextNode = $yNode->getFirstChild();
        my $yInteger = $yTextNode->getNodeValue();
        my $point = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY(int($xInteger), int($yInteger));
        $self->addPoint($point);
}


# Java overloaded method: Perl keeps the last definition
sub addPoint {
    my ($self, $point) = @_;
        $self->{points}->getPoints()->add($point);
        $self->{logUtil}->putF($point->toString(), $self, "addPoint");
        $self->{pointTreeNodeVector}->add('javax::swing::tree::DefaultMutableTreeNode'->new($point->toString()));
        $self->{treeNode}->add($self->{pointTreeNodeVector}->get($self->{pointTreeNodeVector}->size() - 1));
}


sub removePoint {
    my ($self) = @_;
        my $point = undef;
        if ($self->{points}->getSize() > 0) {
            my $lastPoint = $self->{points}->getSize() - 1;
            $point = $self->{points}->getPoints()->removeAt($lastPoint);
            my $index = $self->{pointTreeNodeVector}->size() - 1;
            if ($index > 0) {
                $self->{treeNode}->remove($self->{pointTreeNodeVector}->get($index));
                $self->{pointTreeNodeVector}->remove($index);
            }
        }
        return $point;
}


sub isActive {
    my ($self) = @_;
        return $self->{active};
}


sub deactivate {
    my ($self) = @_;
        $self->{active} = 0;
}


sub activate {
    my ($self) = @_;
        $self->{active} = 1;
}


# throws Exception
sub duplicatePoints {
    my ($self, $list) = @_;
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $point = $list->get($index);
            if (defined($point)) {
                $self->{points}->getPoints()->add('org::allbinary::graphics::PointFactory'->getInstance()->createXY($point->getX(), $point->getY()));
                $self->{pointTreeNodeVector}->add('javax::swing::tree::DefaultMutableTreeNode'->new($point->toString()));
                $self->{treeNode}->add($self->{pointTreeNodeVector}->get($self->{pointTreeNodeVector}->size() - 1));
            }
        }
}


# throws Exception
sub duplicate {
    my ($self) = @_;
        my $linesGraphicItem = 'org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->new();
        $linesGraphicItem->duplicatePoints($self->{points}->getPoints());
        $linesGraphicItem->deactivate();
        return $linesGraphicItem;
}


sub getAngle {
    my ($self) = @_;
        return (($self->{theta}) * 180 / 3.14159265358979);
}


sub setFulcrumPoint {
    my ($self, $point) = @_;
        $self->{fulcrumPoint} = $point;
}


sub paint {
    my ($self, $g, $canvasAngle, $dimension, $x, $y) = @_;
        try {
            my $graphics = $g;
            $graphics->setColor($self->getColor());
            $graphics->setStroke('org::allbinary::graphics::j2me::workarea::tools::BasicStroke'->new($x));
            if ($self->isActive() && defined($self->{currentMousePoint})) {
                $self->{points}->getPoints()->add($self->{currentMousePoint});
            }
            my $tempPointVector = 'org::allbinary::graphics::j2me::workarea::tools::PointsUtil'->getInstance()->doTransforms($self->{points}->getPoints(), $canvasAngle, 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($dimension->getWidth(), $dimension->getHeight()));
            if ($self->isActive() && defined($self->{currentMousePoint})) {
                $self->{currentMousePoint} = $self->{points}->getPoints()->removeAt($self->{points}->getSize() - 1);
            }
            my $size = $tempPointVector->size();
            my $firstPoint = undef;
            if ($size > 0) {
                $firstPoint = $tempPointVector->get(0);
            }
            for (my $index = 1; $index < $size; $index++) {
                my $secondPoint = $tempPointVector->get($index);
                $graphics->drawLine(($firstPoint->getX() * $x) - (int($x / 4)), ($firstPoint->getY() * $y) - (int($y / 4)), ($secondPoint->getX() * $x) - (int($x / 4)), ($secondPoint->getY() * $y) - (int($y / 4)));
                $firstPoint = $secondPoint;
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "mouseMoved", $e);
        }
}


# throws Exception
sub toDom {
    my ($self, $canvasDom) = @_;
        return 'org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil'->getInstance()->toDom($canvasDom, $self->{points}->getPoints());
}


sub isValid {
    my ($self) = @_;
        return $self->{points}->isValid();
}


sub getPointsInterface {
    my ($self) = @_;
        return $self->{points};
}


sub setPointsInterface {
    my ($self, $points) = @_;
        $self->{points} = $points;
}


sub getColor {
    my ($self) = @_;
        return $self->{color};
}


sub setColor {
    my ($self, $color) = @_;
        $self->{color} = $color;
}


sub mouseClicked {
    my ($self, $mouseEvent, $x, $y) = @_;
        try {
            my $mousePoint = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($mouseEvent->getPoint()->{x}, $mouseEvent->getPoint()->{y});
            if (($mouseEvent->getModifiers() & $mouseEvent->{BUTTON1_MASK}) == $mouseEvent->{BUTTON1_MASK}) {
                my $point = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($mousePoint->getX() / $x, $mousePoint->getY() / $y);
                'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Line Point Added: " . $point->toString());
                $self->addPoint($point);
            } elsif (($mouseEvent->getModifiers() & $mouseEvent->{BUTTON3_MASK}) == $mouseEvent->{BUTTON3_MASK}) {
                'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Line Point Removed");
                $self->removePoint();
            }
            $self->{currentMousePoint} = $mousePoint;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "mouseMoved", $e);
        }
}


sub mouseEntered {
    my ($self, $mouseEvent) = @_;
}


sub mouseExited {
    my ($self, $mouseEvent) = @_;
}


sub mousePressed {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
}


sub mouseReleased {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
}


sub mouseDragged {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
}


sub mouseMoved {
    my ($self, $mouseEvent, $x, $y) = @_;
        try {
            my $mousePoint = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($mouseEvent->getPoint()->{x}, $mouseEvent->getPoint()->{y});
            my $point = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($mousePoint->getX() / $x, $mousePoint->getY() / $y);
            $self->{currentMousePoint} = $point;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "mouseMoved", $e);
        }
}


sub keyPressed {
    my ($self, $keyEvent) = @_;
        try {
            my $keyCode = $keyEvent->getKeyCode();
            if ($keyCode == $keyEvent->{VK_ESCAPE}) {
                'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Deactivated");
                $self->deactivate();
            } elsif ($keyCode == $keyEvent->{VK_UP}) {
                $self->translate(0, -1);
            } elsif ($keyCode == $keyEvent->{VK_DOWN}) {
                $self->translate(0, 1);
            } elsif ($keyCode == $keyEvent->{VK_LEFT}) {
                $self->translate(-1, 0);
            } elsif ($keyCode == $keyEvent->{VK_RIGHT}) {
                $self->translate(1, 0);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{gameInputStrings}->{KEY_PRESSED}, $e);
        }
}


sub keyReleased {
    my ($self, $keyEvent) = @_;
}


sub keyTyped {
    my ($self, $keyEvent) = @_;
}

# use java::awt;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::swing::tree::DefaultMutableTreeNode;
# use javax::swing::tree::MutableTreeNode;
use org::allbinary::dom::DomHelper;
use org::allbinary::game::input::GameInputStrings;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::j2me::StatusFactory;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasDom;
use org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension;
use org::allbinary::graphics::pipeline::BasicGraphicsPipeline;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface;
use org::allbinary::graphics::j2me::workarea::tools::Color;
use org::allbinary::graphics::j2me::workarea::tools::Points;
use org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil;
use org::allbinary::graphics::j2me::workarea::tools::BasicStroke;
use org::allbinary::graphics::j2me::workarea::tools::PointsUtil;

1;

