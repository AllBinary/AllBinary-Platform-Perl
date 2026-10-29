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

package org::allbinary::graphics::j2me::workarea::tools::SelectionTool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();
use parent -norequire,'org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface';

our $NAME = "Selection Tool";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{canvasJPanel} = undef;
    $self->{active} = 1;
    $self->{controlIdDown} = 0;
    $self->{rectColor} = 'org::allbinary::graphics::j2me::workarea::tools::Color'->new(int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}));
    $self->{startPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
    $self->{endPoint} = $self->{startPoint};
}


sub new {
    my ($class, $canvasJPanel) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{canvasJPanel} = $canvasJPanel;
    return $self;
}


sub setColor {
    my ($self, $color) = @_;
}


sub getTreeNode {
    my ($self) = @_;
        return undef;
}


sub getPointsInterface {
    my ($self) = @_;
        return undef;
}


sub setPointsInterface {
    my ($self, $points) = @_;
}


sub isValid {
    my ($self) = @_;
        return 1;
}


sub isActive {
    my ($self) = @_;
        return $self->{active};
}


sub deactivate {
    my ($self) = @_;
}


sub activate {
    my ($self) = @_;
}


sub setFulcrumPoint {
    my ($self, $point) = @_;
}


# throws Exception
sub translate {
    my ($self, $x, $y) = @_;
}


sub setRotate {
    my ($self, $theta) = @_;
}


sub addRotate {
    my ($self, $theta) = @_;
}


sub setAngle {
    my ($self, $angle) = @_;
}


sub addAngle {
    my ($self, $angle) = @_;
}


sub getAngle {
    my ($self) = @_;
        return 0.0;
}


sub makeSelection {
    my ($self) = @_;
        my $xRect = $self->getXRect();
        my $xRect2 = abs($self->{endPoint}->getX() - $self->{startPoint}->getX()) + $xRect;
        my $yRect = $self->getYRect();
        my $yRect2 = abs($self->{endPoint}->getY() - $self->{startPoint}->getY()) + $yRect;
        my $hashMap = $self->{canvasJPanel}->getGraphicItemHashMap();
        my $graphicItemArray = $hashMap->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $hashMap->get($graphicItemArray->[$index]);
            if ($item->getName() eq 'org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->getStaticName()) {
                if ('org::allbinary::math::RectangleCollisionPointUtil'->allPointsInsideCell($xRect, $yRect, $xRect2, $yRect2, $item->getPointsInterface()->getPoints(), $self->{canvasJPanel}->getXPixelsPerWorkAreaPixel(), $self->{canvasJPanel}->getYPixelsPerWorkAreaPixel())) {
                    $item->setColor($org::allbinary::graphics::j2me::workarea::tools::Color::YELLOW);
                    $item->activate();
                } elsif (!$self->{controlIdDown}) {
                    $item->setColor($org::allbinary::graphics::j2me::workarea::tools::Color::WHITE);
                    $item->deactivate();
                }
            }
        }
}


sub getXRect {
    my ($self) = @_;
        my $xDiff = $self->{endPoint}->getX() - $self->{startPoint}->getX();
        my $xRect = $self->{startPoint}->getX();
        if ($xDiff < 0) {
            $xRect = $self->{endPoint}->getX();
        }
        return $xRect;
}


sub getYRect {
    my ($self) = @_;
        my $yDiff = $self->{endPoint}->getY() - $self->{startPoint}->getY();
        my $yRect = $self->{startPoint}->getY();
        if ($yDiff < 0) {
            $yRect = $self->{endPoint}->getY();
        }
        return $yRect;
}


sub paint {
    my ($self, $g, $canvasAngle, $dimension, $x, $y) = @_;
        $g->setColor($self->{rectColor});
        my $xRect = $self->getXRect();
        my $width = abs($self->{endPoint}->getX() - $self->{startPoint}->getX());
        my $yRect = $self->getYRect();
        my $height = abs($self->{endPoint}->getY() - $self->{startPoint}->getY());
        $g->drawRect($xRect, $yRect, $width, $height);
}


# throws Exception
sub toDom {
    my ($self, $canvasDom) = @_;
        return undef;
}


sub removePoint {
    my ($self) = @_;
        return undef;
}


sub addPoint {
    my ($self, $point) = @_;
}


sub getName {
    my ($self) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::SelectionTool::NAME;
}


sub getStaticName {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::SelectionTool::NAME;
}


sub mouseClicked {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
}


sub mouseMoved {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
}


sub mouseEntered {
    my ($self, $mouseEvent) = @_;
}


sub mouseExited {
    my ($self, $mouseEvent) = @_;
}


sub mousePressed {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, 'org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->getInstance()->{MOUSE_PRESSED});
        $self->{startPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($mouseEvent->getX(), $mouseEvent->getY());
        $self->{endPoint} = $self->{startPoint};
}


sub mouseReleased {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, 'org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->getInstance()->{MOUSE_RELEASED});
        $self->{endPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($mouseEvent->getX(), $mouseEvent->getY());
        $self->{active} = 0;
        $self->makeSelection();
}


sub mouseDragged {
    my ($self, $mouseEvent, $xPixelsPerCell, $yPixelsPerCell) = @_;
        $self->{endPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($mouseEvent->getX(), $mouseEvent->getY());
}


sub keyPressed {
    my ($self, $keyEvent) = @_;
        if ($keyEvent->getKeyCode() == $keyEvent->{VK_CONTROL}) {
            $self->{controlIdDown} = 1;
        }
}


sub keyReleased {
    my ($self, $keyEvent) = @_;
        if ($keyEvent->getKeyCode() == $keyEvent->{VK_CONTROL}) {
            $self->{controlIdDown} = 0;
        }
}


sub keyTyped {
    my ($self, $keyEvent) = @_;
}


# throws Exception
sub duplicate {
    my ($self) = @_;
        return undef;
}

# use java::awt;
use java::util::HashMap;
# use javax::swing::tree::MutableTreeNode;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasDom;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel;
use org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::math::RectangleCollisionPointUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Node;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface;
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;
use org::allbinary::graphics::j2me::workarea::tools::Color;
use org::allbinary::graphics::j2me::workarea::tools::MouseStrings;

1;

