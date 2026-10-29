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

package org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel','java::awt::event::MouseListener','java::awt::event::MouseMotionListener','java::awt::event::KeyListener','org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventListener';

our $frame = 0;
our $gridColor = 'org::allbinary::graphics::j2me::workarea::canvas::Color'->new(int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE}));
our $backgroundColor = 'org::allbinary::graphics::j2me::workarea::canvas::Color'->new(int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{CLEAR_COLOR}));

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{guiLog} = 'org::allbinary::logic::communication::log::GuiLog'->getInstance();
    $self->{gameInputStrings} = 'org::allbinary::game::input::GameInputStrings'->getInstance();
    $self->{selectedTool} = undef;
    $self->{graphicItemHashMap} = undef;
    $self->{canvasDimension} = undef;
    $self->{angle} = 0.0;
    $self->{canvasTreeNode} = undef;
    $self->{frameLabel} = undef;
    $self->{workAreaJTreeJPanel} = undef;
    $self->{grid} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of CanvasJPanel takes " . scalar(@arguments) . " arguments";
}


sub _new4 {
    my ($class, $workAreaJTreeJPanel, $dimension, $x, $y) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{grid} = 'org::allbinary::graphics::j2me::workarea::canvas::Grid'->new();
        try {
            $self->{workAreaJTreeJPanel} = $workAreaJTreeJPanel;
            $self->initComponents();
            $self->initMyComponents();
            $self->setSize($dimension);
            $self->setCanvasSize($x, $y);
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::GRAPHICSCREATION)) {
                $self->{guiLog}->put("Constructor Error", $self, "contructor", $e);
            }
        }
    return $self;
}


sub _new3 {
    my ($class, $workAreaJTreeJPanel, $dimension, $canvasDom) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{grid} = 'org::allbinary::graphics::j2me::workarea::canvas::Grid'->new($canvasDom->getGrid());
        try {
            $self->{workAreaJTreeJPanel} = $workAreaJTreeJPanel;
            $self->initComponents();
            $self->initMyComponents();
            $self->setSize($dimension);
            $self->setCanvasSize($canvasDom->getDimension()->getWidth(), $canvasDom->getDimension()->getHeight());
            $self->{graphicItemHashMap} = $canvasDom->getGraphicItemHashMap();
            my $graphicItemArray = $self->{graphicItemHashMap}->keySet()->toArray();
            my $size = scalar(@{$graphicItemArray});
            for (my $index = 0; $index < $size; $index++) {
                my $graphicItemTreeNode = $graphicItemArray->[$index];
                $self->{canvasTreeNode}->add($graphicItemTreeNode);
            }
            $self->repaint();
            $self->setAngle($canvasDom->getAngle());
            $self->{workAreaJTreeJPanel}->updateTree();
            $self->{workAreaJTreeJPanel}->expand();
            $self->{workAreaJTreeJPanel}->repaint();
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::GRAPHICSCREATION)) {
                $self->{guiLog}->put("Constructor Error", $self, "contructor", $e);
            }
        }
    return $self;
}


# throws Exception
sub initMyComponents {
    my ($self) = @_;
        $self->{frameLabel} = 'org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel'->new("FrameLabel" . $org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel::frame->toString());
        $self->{canvasTreeNode} = 'javax::swing::tree::DefaultMutableTreeNode'->new($self->{frameLabel});
        $org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel::frame++;
        $self->{workAreaJTreeJPanel}->add($self->getTreeNode());
        $self->{graphicItemHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{grid}->{grid} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY(0, 0);
        $self->setCanvasDimension('org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension'->new(0, 0));
        $self->{selectedTool} = undef;
        $self->addKeyListener($self);
        $self->addMouseListener($self);
        $self->addMouseMotionListener($self);
        'org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService'->addListener($self);
}


sub getTreeNode {
    my ($self) = @_;
        return $self->{canvasTreeNode};
}


sub initComponents {
    my ($self) = @_;
        $self->setLayout('java::awt::GridLayout'->new(1, 1));
}


# throws Exception
sub setCanvasSize {
    my ($self, $x, $y) = @_;
        $self->{grid}->{isGridPossible} = 1;
        if ($x <= 0) {
            $self->{grid}->{isGridPossible} = 0;
            die ("X Size Error: " . $x, $self, "setWorkAreaSize");
        }
        if ($y <= 0) {
            $self->{grid}->{isGridPossible} = 0;
            die ("Y Size Error: " . $y, $self, "setWorkAreaSize");
        }
        if ($x > $self->getWidth()) {
            $self->{grid}->{isGridPossible} = 0;
        }
        if ($y > $self->getHeight()) {
            $self->{grid}->{isGridPossible} = 0;
        }
        $self->setCanvasDimension('org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension'->new($x, $y));
        $self->{grid}->{isChanged} = 1;
}


sub setGrid {
    my ($self, $point) = @_;
        $self->setGrid($point->getX(), $point->getY());
}


# Java overloaded method: Perl keeps the last definition
sub setGrid {
    my ($self, $xSize, $ySize) = @_;
        try {
            if ($xSize >= $self->getCanvasDimension()->getWidth() / 2 || $xSize < 1) {
                die ("X Size Error: " . $xSize . " WorkArea X: " . $self->getCanvasDimension()->getWidth(), $self, "setGrid");
            }
            if ($ySize >= $self->getCanvasDimension()->getHeight() / 2 || $ySize < 1) {
                die ("Y Size Error" . $ySize . " WorkArea Y: " . $self->getCanvasDimension()->getHeight(), $self, "setGrid");
            }
            $self->{grid}->{grid} = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($xSize, $ySize);
            $self->{grid}->{isChanged} = 1;
        } catch ($e) {
        }
}


# throws Exception
sub setDefaultGrid {
    my ($self) = @_;
        my $xPixelsPerWorkAreaPixel = $self->getWidth() / $self->getCanvasDimension()->getWidth();
        my $yPixelsPerWorkAreaPixel = $self->getHeight() / $self->getCanvasDimension()->getHeight();
        $self->setGrid(1, 1);
        $self->{grid}->{isChanged} = 1;
}


sub getAngle {
    my ($self) = @_;
        return $self->{angle};
}


sub setAngle {
    my ($self, $angle) = @_;
        $self->{angle} = $angle;
}


sub addAngle {
    my ($self, $angle) = @_;
        $self->setAngle($self->{angle} + $angle);
}


sub explodeAll {
    my ($self) = @_;
        my $newPoints = 'org::allbinary::util::BasicArrayListD'->new();
        my $graphicItemArray = $self->getGraphicItemHashMap()->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $graphicItemNode = $graphicItemArray->[$index];
            my $graphicItem = $self->getGraphicItemHashMap()->get($graphicItemNode);
            if ($graphicItem->getName() eq 'org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->getStaticName()) {
                while ($graphicItem->getPointsInterface()->getSize() > 2) {
                    my $newGraphicItem = 'org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory'->getInstance()->getInstance($graphicItem->getName())->getInstance($self);
                    my $pointOne = 'org::allbinary::graphics::GPoint'->getInstance($graphicItem->removePoint());
                    my $pointTwo = 'org::allbinary::graphics::GPoint'->getInstance($graphicItem->removePoint());
                    if (defined($pointOne) && defined($pointTwo)) {
                        $newGraphicItem->addPoint($pointOne);
                        $newGraphicItem->addPoint($pointTwo);
                    }
                    $newPoints->add($newGraphicItem);
                }
            }
        }
        my $size2 = $newPoints->size();
        for (my $index = 0; $index < $size2; $index++) {
            my $newGraphicItem = $newPoints->get($index);
            $self->{canvasTreeNode}->add($newGraphicItem->getTreeNode());
            $self->getGraphicItemHashMap()->put($newGraphicItem->getTreeNode(), $newGraphicItem);
        }
        $self->{workAreaJTreeJPanel}->updateTree();
        $self->{workAreaJTreeJPanel}->expand();
        $self->{workAreaJTreeJPanel}->repaint();
}


# throws Exception
sub explode {
    my ($self, $howMuch, $explosionType) = @_;
        my $graphicItemArray = $self->getGraphicItemHashMap()->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $self->getGraphicItemHashMap()->get($graphicItemArray->[$index]);
            my $basicArrayList = 'org::allbinary::animation::VectorExplosionGenerator'->getInstance()->createList($item->getPointsInterface()->getPoints(), $howMuch, 'org::allbinary::animation::VectorExplosionGenerator'->getInstance()->{RANDOM});
            my $newPoints = 'org::allbinary::graphics::j2me::workarea::tools::Points'->new();
            $newPoints->addPoints($basicArrayList);
            $item->setPointsInterface($newPoints);
            my $angleDelta = 'org::allbinary::graphics::pipeline::RandomRotationFactory'->getInstance()->getNextRandomAngle($howMuch);
            $item->setAngle($angleDelta);
        }
        $self->repaint();
}


# throws Exception
sub mirror {
    my ($self) = @_;
        my $width = $self->getCanvasDimension()->getWidth();
        my $graphicItemArray = $self->getGraphicItemHashMap()->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $self->getGraphicItemHashMap()->get($graphicItemArray->[$index]);
            my $basicArrayList = 'org::allbinary::animation::VectorMirrorGenerator'->getInstance()->getInstance($item->getPointsInterface()->getPoints(), $width);
            my $newPoints = 'org::allbinary::graphics::j2me::workarea::tools::Points'->new();
            $newPoints->addPoints($basicArrayList);
            $item->setPointsInterface($newPoints);
        }
        $self->repaint();
}


# throws Exception
sub center {
    my ($self) = @_;
        'org::allbinary::animation::vector::VectorCenterGenerator'->new()->transform($self->getGraphicItemHashMap());
        $self->repaint();
}


sub setNewTool {
    my ($self) = @_;
        try {
            'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Tool Selected");
            $self->{selectedTool} = 'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->getInstance()->getSelectedToolFactory()->getInstance($self);
            my $newNode = $self->{selectedTool}->getTreeNode();
            $self->getGraphicItemHashMap()->put($newNode, $self->{selectedTool});
            $self->{canvasTreeNode}->add($newNode);
            if (!defined($self->getSelectedTool())) {
                die ("No Tool Selected", $self, "setSelectedTool");
            }
        } catch ($e) {
        }
}


# throws Exception
sub duplicateGraphicItem {
    my ($self, $graphicItem) = @_;
        my $graphicItemClone = $graphicItem->duplicate();
        $self->getGraphicItemHashMap()->put($graphicItemClone->getTreeNode(), $graphicItemClone);
        $self->{canvasTreeNode}->add($graphicItemClone->getTreeNode());
}


# throws Exception
sub duplicateGraphicItemHashMap {
    my ($self, $hashMap) = @_;
        my $mutableTreeNodeArray = $hashMap->keySet()->toArray();
        my $size = scalar(@{$mutableTreeNodeArray});
        for (my $index = 0; $index < $size; $index++) {
            my $treeNode = $mutableTreeNodeArray->[$index];
            my $graphicItem = $hashMap->get($treeNode);
            $self->duplicateGraphicItem($graphicItem);
        }
}


sub getGraphicItemHashMap {
    my ($self) = @_;
        return $self->{graphicItemHashMap};
}


sub getXPixelsPerWorkAreaPixel {
    my ($self) = @_;
        my $x = $self->getGrid()->{grid}->getX() * ($self->getWidth() - 10) / $self->getCanvasDimension()->getWidth();
        if ($self->getGrid()->getZoom() == 1) {
            return 1;
        } else {
            return $x;
        }
}


sub getYPixelsPerWorkAreaPixel {
    my ($self) = @_;
        my $y = $self->getGrid()->{grid}->getY() * ($self->getHeight() - 10) / $self->getCanvasDimension()->getHeight();
        if ($self->getGrid()->getZoom() == 1) {
            return 1;
        } else {
            return $y;
        }
}


sub getSelectedTool {
    my ($self) = @_;
        return $self->{selectedTool};
}


sub drawItems {
    my ($self, $graphics) = @_;
        my $angleDouble = $self->{angle};
        my $graphicItemArray = $self->getGraphicItemHashMap()->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $self->getGraphicItemHashMap()->get($graphicItemArray->[$index]);
            $item->paint($graphics, $angleDouble, $self->getCanvasDimension(), $self->getXPixelsPerWorkAreaPixel(), $self->getYPixelsPerWorkAreaPixel());
        }
}


sub drawGrid {
    my ($self, $graphics) = @_;
        my $xAdjust = ($self->getWidth() % $self->getXPixelsPerWorkAreaPixel()) / 2;
        my $yAdjust = ($self->getHeight() % $self->getYPixelsPerWorkAreaPixel()) / 2;
        my $xLeft = $xAdjust;
        my $yUpper = $yAdjust;
        my $xRight = $self->getWidth() - $xAdjust;
        my $yLower = $self->getHeight() - $yAdjust;
        $graphics->setColor($org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel::gridColor);
        for (my $value = $yAdjust; $value <= $self->getHeight() - $yAdjust; $value += $self->getYPixelsPerWorkAreaPixel()) {
            $graphics->drawLine($xLeft, $value, $xRight, $value);
        }
        for (my $value = $xAdjust; $value <= $self->getWidth() - $xAdjust; $value += $self->getYPixelsPerWorkAreaPixel()) {
            $graphics->drawLine($value, $yUpper, $value, $yLower);
        }
}


sub paint {
    my ($self, $graphics) = @_;
        try {
            if ($self->getGrid()->{isChanged}) {
                $graphics->setColor($org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel::backgroundColor);
                $graphics->fillRect(0, 0, $self->getWidth(), $self->getHeight());
                if ($self->getGrid()->getZoom() > 2 && $self->getGrid()->{isGridOn} && $self->getGrid()->{isGridPossible}) {
                    $self->setDefaultGrid();
                    $self->drawGrid($graphics);
                }
                $self->drawItems($graphics);
                $graphics->drawString($self->getAngle()->toString(), $self->getWidth() - 75, $self->getHeight() - 15);
                $self->{grid}->{isChanged} = 0;
            }
        } catch ($e) {
        }
}


sub repaint {
    my ($self) = @_;
        if (defined($self->{grid})) {
            $self->{grid}->{isChanged} = 1;
        }
        $self->SUPER::repaint();
}


# throws Exception
sub toDom {
    my ($self) = @_;
        return 'org::allbinary::graphics::j2me::workarea::canvas::CanvasDom'->new($self)->toDom();
}


sub changed {
    my ($self) = @_;
        $self->{grid}->{isChanged} = 1;
}


sub mouseClicked {
    my ($self, $mouseEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatusNoLog('org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->getInstance()->{MOUSE_CLICKED_LABEL} + $self->logMouseEvent($mouseEvent));
        if (defined($self->getSelectedTool()) && $self->getSelectedTool()->isActive()) {
            my $graphicItem = $self->getSelectedTool();
            $graphicItem->mouseClicked($mouseEvent, $self->getXPixelsPerWorkAreaPixel(), $self->getYPixelsPerWorkAreaPixel());
        } else {
            $self->setNewTool();
            my $graphicItem = $self->getSelectedTool();
            if (defined($graphicItem)) {
                $graphicItem->mouseClicked($mouseEvent, $self->getXPixelsPerWorkAreaPixel(), $self->getYPixelsPerWorkAreaPixel());
            }
        }
        $self->{grid}->{isChanged} = 1;
        $self->repaint();
        $self->{workAreaJTreeJPanel}->updateTree();
        $self->{workAreaJTreeJPanel}->expand();
        $self->{workAreaJTreeJPanel}->repaint();
}


sub mouseEntered {
    my ($self, $mouseEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatusNoLog($self->logMouseEvent($mouseEvent));
}


sub mouseExited {
    my ($self, $mouseEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatusNoLog($self->logMouseEvent($mouseEvent));
}


sub mousePressed {
    my ($self, $mouseEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatusNoLog('org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->getInstance()->{MOUSE_PRESSED_LABEL} + $self->logMouseEvent($mouseEvent));
        if (defined($self->getSelectedTool())) {
            my $graphicItem = $self->getSelectedTool();
            $graphicItem->mousePressed($mouseEvent, $self->getXPixelsPerWorkAreaPixel(), $self->getYPixelsPerWorkAreaPixel());
        }
        $self->requestFocus();
        $self->{grid}->{isChanged} = 1;
        $self->repaint();
}


sub mouseReleased {
    my ($self, $mouseEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatusNoLog('org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->getInstance()->{MOUSE_RELEASED_LABEL} + $self->logMouseEvent($mouseEvent));
        my $graphicItem = $self->getSelectedTool();
        if (defined($graphicItem)) {
            $graphicItem->mouseReleased($mouseEvent, $self->getXPixelsPerWorkAreaPixel(), $self->getYPixelsPerWorkAreaPixel());
        }
        $self->requestFocus();
        $self->{grid}->{isChanged} = 1;
        $self->repaint();
}


sub mouseDragged {
    my ($self, $mouseEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatusNoLog('org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->getInstance()->{MOUSE_DRAGGED_LABEL} + $self->logMouseEvent($mouseEvent));
        my $graphicItem = $self->getSelectedTool();
        if (defined($graphicItem)) {
            $graphicItem->mouseDragged($mouseEvent, $self->getXPixelsPerWorkAreaPixel(), $self->getYPixelsPerWorkAreaPixel());
        }
        $self->requestFocus();
        $self->{grid}->{isChanged} = 1;
        $self->repaint();
}


sub mouseMoved {
    my ($self, $mouseEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatusNoLog('org::allbinary::graphics::j2me::workarea::tools::MouseStrings'->getInstance()->{MOUSE_MOVED_LABEL} + $self->logMouseEvent($mouseEvent));
        if (defined($self->getSelectedTool()) && $self->getSelectedTool()->isActive()) {
            my $graphicItem = $self->getSelectedTool();
            $graphicItem->mouseMoved($mouseEvent, $self->getXPixelsPerWorkAreaPixel(), $self->getYPixelsPerWorkAreaPixel());
        }
        $self->requestFocus();
        $self->{grid}->{isChanged} = 1;
        $self->repaint();
}


sub logMouseEvent {
    my ($self, $mouseEvent) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::math::PositionStrings'->getInstance()->{X_LABEL});
        $stringBuffer->appendint(int($mouseEvent->getX() / $self->getXPixelsPerWorkAreaPixel()));
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append('org::allbinary::math::PositionStrings'->getInstance()->{Y_LABEL});
        $stringBuffer->appendint(int($mouseEvent->getY() / $self->getYPixelsPerWorkAreaPixel()));
        return $stringBuffer->toString();
}


sub keyPressed {
    my ($self, $keyEvent) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Key Pressed");
        try {
            my $graphicItemArray = $self->{graphicItemHashMap}->keySet()->toArray();
            my $size = scalar(@{$graphicItemArray});
            for (my $index = 0; $index < $size; $index++) {
                my $graphicItemInterface = $self->{graphicItemHashMap}->get($graphicItemArray->[$index]);
                my $keyCode = $keyEvent->getKeyCode();
                if ($graphicItemInterface->isActive()) {
                    if ($keyCode == $keyEvent->{VK_UP}) {
                        $graphicItemInterface->translate(0, -1);
                    } elsif ($keyCode == $keyEvent->{VK_DOWN}) {
                        $graphicItemInterface->translate(0, 1);
                    } elsif ($keyCode == $keyEvent->{VK_LEFT}) {
                        $graphicItemInterface->translate(-1, 0);
                    } elsif ($keyCode == $keyEvent->{VK_RIGHT}) {
                        $graphicItemInterface->translate(1, 0);
                    }
                }
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $self->{gameInputStrings}->{KEY_PRESSED}, $e);
        }
        if (defined($self->getSelectedTool()) && $self->getSelectedTool()->isActive()) {
            'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Key Pressed for Tool");
            my $graphicItem = $self->getSelectedTool();
            $graphicItem->keyPressed($keyEvent);
        } else {
            $self->setNewTool();
        }
        $self->{grid}->{isChanged} = 1;
        $self->repaint();
}


sub keyReleased {
    my ($self, $keyEvent) = @_;
}


sub keyTyped {
    my ($self, $keyEvent) = @_;
}


sub delete {
    my ($self, $evt) = @_;
        $self->getGraphicItemHashMap()->remove($evt->getTreeNode());
        $self->{workAreaJTreeJPanel}->updateTree();
        $self->{workAreaJTreeJPanel}->expand();
        $self->{workAreaJTreeJPanel}->repaint();
}


sub deselect {
    my ($self, $evt) = @_;
        my $graphicItemInterface = $self->getGraphicItemHashMap()->get($evt->getTreeNode());
        if (defined($graphicItemInterface)) {
            $graphicItemInterface->setColor($org::allbinary::graphics::j2me::workarea::canvas::Color::WHITE);
            $graphicItemInterface->deactivate();
            $self->{workAreaJTreeJPanel}->repaint();
        }
}


sub highlight {
    my ($self, $evt) = @_;
        my $graphicItemInterface = $self->getGraphicItemHashMap()->get($evt->getTreeNode());
        if (defined($graphicItemInterface)) {
            $graphicItemInterface->setColor($org::allbinary::graphics::j2me::workarea::canvas::Color::YELLOW);
            $graphicItemInterface->activate();
            $self->{workAreaJTreeJPanel}->repaint();
        }
}


# throws Exception
sub duplicate {
    my ($self) = @_;
        my $newCanvasJPanel = 'org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel'->new($self->{workAreaJTreeJPanel}, $self->getSize(), $self->getCanvasDimension()->getWidth(), $self->getCanvasDimension()->getHeight());
        $newCanvasJPanel->setGrid($self->getGrid()->getGrid());
        $newCanvasJPanel->setAngle($self->getAngle());
        $newCanvasJPanel->duplicateGraphicItemHashMap($self->getGraphicItemHashMap());
        $self->{workAreaJTreeJPanel}->updateTree();
        $self->{workAreaJTreeJPanel}->expand();
        $self->{workAreaJTreeJPanel}->repaint();
        return $newCanvasJPanel;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub duplicate {
    my ($self, $event) = @_;
        my $treeNode = $event->getTreeNode();
        my $graphicItem = $self->getGraphicItemHashMap()->get($treeNode);
        if (defined($graphicItem)) {
            $self->duplicateGraphicItem($graphicItem);
            $self->{workAreaJTreeJPanel}->updateTree();
            $self->{workAreaJTreeJPanel}->expand();
            $self->{workAreaJTreeJPanel}->repaint();
        }
}


sub rotate {
    my ($self, $event) = @_;
        my $treeNode = $event->getTreeNode();
        my $graphicItem = $self->getGraphicItemHashMap()->get($treeNode);
        if (defined($graphicItem)) {
            $graphicItem->addAngle($event->getAngle());
        }
}


sub getCanvasDimension {
    my ($self) = @_;
        return $self->{canvasDimension};
}


sub setCanvasDimension {
    my ($self, $canvasDimension) = @_;
        $self->{canvasDimension} = $canvasDimension;
}


sub getGrid {
    my ($self) = @_;
        return $self->{grid};
}

# use java::awt;
use java::util::HashMap;
# use javax::swing::tree::DefaultMutableTreeNode;
# use javax::swing::tree::MutableTreeNode;
use org::allbinary::animation::VectorExplosionGenerator;
use org::allbinary::animation::VectorMirrorGenerator;
use org::allbinary::animation::vector::VectorCenterGenerator;
use org::allbinary::game::input::GameInputStrings;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::j2me::GraphicsException;
use org::allbinary::graphics::j2me::StatusFactory;
use org::allbinary::graphics::j2me::workarea::WorkAreaJTreeJPanel;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface;
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;
use org::allbinary::graphics::j2me::workarea::tools::MouseStrings;
use org::allbinary::graphics::j2me::workarea::tools::Points;
use org::allbinary::graphics::j2me::workarea::tools::ToolFactory;
use org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent;
use org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventListener;
use org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService;
use org::allbinary::graphics::pipeline::RandomRotationFactory;
use org::allbinary::log::LOGGING;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::GuiLog;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::w3c::dom::Node;
use org::allbinary::graphics::j2me::workarea::canvas::Color;
use org::allbinary::graphics::j2me::workarea::canvas::Grid;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel;
use org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasDom;

1;

