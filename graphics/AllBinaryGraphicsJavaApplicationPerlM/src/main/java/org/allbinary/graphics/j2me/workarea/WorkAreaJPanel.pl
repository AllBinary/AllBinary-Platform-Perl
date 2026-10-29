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

package org::allbinary::graphics::j2me::workarea::WorkAreaJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::graphics::j2me::workarea::JPanel','org::allbinary::graphics::j2me::workarea::WorkAreaJPanelInterface','org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventListener','java::util::EventListener';

our $document = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{canvasJPanelList} = undef;
    $self->{canvasHolderJPanel} = undef;
    $self->{name} = undef;
    $self->{selectedFrame} = 0;
    $self->{propertiesJPanel} = undef;
    $self->{workAreaJTreeJPanel} = undef;
    $self->{isPlaying} = 0;
    $self->{innerJPanel} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of WorkAreaJPanel takes " . scalar(@arguments) . " arguments";
}


sub _new4 {
    my ($class, $name, $dimension, $x, $y) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        try {
            $self->initComponents();
            $self->{name} = $name;
            $self->initMyComponents($dimension);
            $self->{workAreaJTreeJPanel} = 'org::allbinary::graphics::j2me::workarea::WorkAreaJTreeJPanel'->new($self->{name});
            my $canvasJPanel = 'org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel'->new($self->{workAreaJTreeJPanel}, $self->getSize(), $x, $y);
            $self->{canvasJPanelList}->add($canvasJPanel);
            $self->{selectedFrame} = 0;
            $self->{propertiesJPanel}->set($self->{workAreaJTreeJPanel});
            $self->{canvasHolderJPanel}->add($canvasJPanel);
        } catch ($e) {
            die $e;
        }
    return $self;
}


sub _new2 {
    my ($class, $workAreaDom, $dimension) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        try {
            $self->initComponents();
            $self->{name} = $workAreaDom->getName();
            $self->initMyComponents($dimension);
            my $canvasNodeList = $workAreaDom->getCanvasNodes();
            my $numberOfFrames = $canvasNodeList->size();
            for (my $index = 0; $index < $numberOfFrames; $index++) {
                my $node = $canvasNodeList->get($index);
                my $canvasJPanel = 'org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel'->new($self->{workAreaJTreeJPanel}, $self->getSize(), 'org::allbinary::graphics::j2me::workarea::canvas::CanvasDom'->new($node));
                $self->{canvasJPanelList}->add($canvasJPanel);
            }
            $self->{selectedFrame} = 0;
            $self->{canvasHolderJPanel}->add($self->getCurrentFrame());
            $self->{propertiesJPanel}->set($self->{workAreaJTreeJPanel});
        } catch ($e) {
            if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::LOADINGERROR)) {
                $self->{logUtil}->put("Constructor Error", $self, "WorkAreaJPanel", $e);
            }
            die $e;
        }
    return $self;
}


sub initMyComponents {
    my ($self, $dimension) = @_;
        $self->{workAreaJTreeJPanel} = 'org::allbinary::graphics::j2me::workarea::WorkAreaJTreeJPanel'->new($self->{name});
        $self->{canvasHolderJPanel} = 'org::allbinary::graphics::j2me::workarea::JPanel'->new();
        $self->{canvasHolderJPanel}->setSize($dimension);
        $self->{canvasHolderJPanel}->setLayout('org::allbinary::graphics::j2me::workarea::GridLayout'->new(1, 1));
        $self->setSize($dimension);
        $self->{canvasJPanelList} = 'java::util::LinkedList'->new();
        my $gridBagLayout = 'org::allbinary::graphics::j2me::workarea::GridBagLayout'->new();
        my $gridBagConstraints = 'org::allbinary::graphics::j2me::workarea::GridBagConstraints'->new();
        $self->{innerJPanel}->setLayout($gridBagLayout);
        $gridBagConstraints->{gridx} = 0;
        $gridBagConstraints->{gridy} = 0;
        $gridBagConstraints->{gridwidth} = 1;
        $gridBagConstraints->{fill} = $org::allbinary::graphics::j2me::workarea::java::awt->{GridBagConstraints}->{BOTH};
        $gridBagConstraints->{weightx} = .05;
        $gridBagConstraints->{weighty} = .05;
        my $toolJPanel = 'org::allbinary::graphics::j2me::workarea::tools::ToolJPanel'->new();
        $gridBagLayout->setConstraints($toolJPanel, $gridBagConstraints);
        $self->{innerJPanel}->add($toolJPanel);
        $gridBagConstraints = 'org::allbinary::graphics::j2me::workarea::GridBagConstraints'->new();
        $gridBagConstraints->{gridx} = 1;
        $gridBagConstraints->{gridy} = 0;
        $gridBagConstraints->{gridwidth} = 6;
        $gridBagConstraints->{fill} = $org::allbinary::graphics::j2me::workarea::java::awt->{GridBagConstraints}->{BOTH};
        $gridBagConstraints->{weightx} = 1;
        $gridBagConstraints->{weighty} = 1;
        $gridBagLayout->setConstraints($self->{canvasHolderJPanel}, $gridBagConstraints);
        $self->{innerJPanel}->add($self->{canvasHolderJPanel});
        $gridBagConstraints = 'org::allbinary::graphics::j2me::workarea::GridBagConstraints'->new();
        $gridBagConstraints->{gridx} = 8;
        $gridBagConstraints->{gridy} = 0;
        $gridBagConstraints->{gridwidth} = $org::allbinary::graphics::j2me::workarea::java::awt->{GridBagConstraints}->{REMAINDER};
        $gridBagConstraints->{fill} = $org::allbinary::graphics::j2me::workarea::java::awt->{GridBagConstraints}->{BOTH};
        $gridBagConstraints->{weightx} = .1;
        $gridBagConstraints->{weighty} = .1;
        $self->{propertiesJPanel} = 'org::allbinary::graphics::j2me::workarea::properties::PropertiesJPanel'->new();
        $gridBagLayout->setConstraints($self->{propertiesJPanel}, $gridBagConstraints);
        $self->{innerJPanel}->add($self->{propertiesJPanel});
        'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->addListener($self);
}


sub getCanvasHashMap {
    my ($self) = @_;
        my $canvasJPanelHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $size = $self->{canvasJPanelList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $canvasJPanel = $self->{canvasJPanelList}->get($index);
            $canvasJPanelHashMap->put($canvasJPanel->getTreeNode(), $index);
        }
        return $canvasJPanelHashMap;
}


sub play {
    my ($self) = @_;
        $self->{isPlaying} = 1;
}


sub stop {
    my ($self) = @_;
        $self->{isPlaying} = 0;
}


sub isPlaying {
    my ($self) = @_;
        return $self->{isPlaying};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub disableCanvas {
    my ($self) = @_;
        $self->{canvasHolderJPanel}->removeAll();
}


sub enableCanvas {
    my ($self) = @_;
        $self->{canvasHolderJPanel}->add($self->getCurrentFrame());
}


sub deselect {
    my ($self) = @_;
        $self->SUPER::setVisible(0);
}


sub select {
    my ($self) = @_;
        $self->SUPER::setVisible(1);
        if ($self->{canvasHolderJPanel}->getComponentCount() == 1) {
            my $component = $self->{canvasHolderJPanel}->getComponent(0);
            if (defined($component)) {
                $component->repaint();
            }
        }
}


sub changeZoom {
    my ($self, $factor) = @_;
        my $size = $self->{canvasJPanelList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $canvasJPanel = $self->{canvasJPanelList}->get($index);
            $canvasJPanel->getGrid()->setZoom($canvasJPanel->getGrid()->getZoom() + $factor);
        }
}


sub getCurrentFrame {
    my ($self) = @_;
        return $self->{canvasJPanelList}->get($self->{selectedFrame});
}


sub initDuplicate {
    my ($self, $newCanvasJPanel) = @_;
        if (defined($newCanvasJPanel)) {
            $self->{canvasJPanelList}->add($newCanvasJPanel);
            $self->select($self->{canvasJPanelList}->size() - 1);
        }
}


# throws Exception
sub duplicate {
    my ($self, $treeNode) = @_;
        my $canvasJPanelHashMap = $self->getCanvasHashMap();
        if ($canvasJPanelHashMap->containsKey($treeNode)) {
            my $frameInteger = $canvasJPanelHashMap->get($treeNode);
            my $canvasJPanel = $self->{canvasJPanelList}->get(int($frameInteger));
            $self->initDuplicate($canvasJPanel->duplicate());
        }
}


# throws Exception
sub autoRotate {
    my ($self, $increments, $totalAngle) = @_;
        my $incrementAngle = (int($totalAngle / $increments));
        for (my $index = 1; $index < $increments; $index++) {
            my $canvasJPanel = $self->getCurrentFrame();
            my $newCanvasJPanel = $canvasJPanel->duplicate();
            $newCanvasJPanel->setAngle($incrementAngle * $index);
            $self->initDuplicate($newCanvasJPanel);
        }
}


sub explodeAll {
    my ($self) = @_;
        my $canvasJPanel = $self->getCurrentFrame();
        $canvasJPanel->explodeAll();
}


# throws Exception
sub autoExplode {
    my ($self, $numberOfFrames, $explodeType) = @_;
        for (my $index = 1; $index < $numberOfFrames; $index++) {
            my $canvasJPanel = $self->getCurrentFrame();
            my $newCanvasJPanel = $canvasJPanel->duplicate();
            $newCanvasJPanel->explode($index + 1, $explodeType);
            $self->initDuplicate($newCanvasJPanel);
        }
}


# throws Exception
sub autoMirror {
    my ($self) = @_;
        my $canvasJPanel = $self->getCurrentFrame();
        my $newCanvasJPanel = $canvasJPanel->duplicate();
        $newCanvasJPanel->mirror();
        $self->initDuplicate($newCanvasJPanel);
}


# Java overloaded method: Perl keeps the last definition
sub select {
    my ($self, $index) = @_;
        if ($index < $self->{canvasJPanelList}->size()) {
            my $canvasJPanel = $self->{canvasJPanelList}->get($index);
            if (defined($canvasJPanel)) {
                $self->{canvasHolderJPanel}->removeAll();
                $self->{canvasHolderJPanel}->add($canvasJPanel);
                $self->{selectedFrame} = $index;
                $canvasJPanel->changed();
                $self->{canvasHolderJPanel}->repaint();
                $canvasJPanel->repaint();
            }
        }
}


# Java overloaded method: Perl keeps the last definition
sub select {
    my ($self, $treeNode) = @_;
        my $canvasJPanelHashMap = $self->getCanvasHashMap();
        my $frameInteger = $canvasJPanelHashMap->get($treeNode);
        if (defined($frameInteger)) {
            $self->select(int($frameInteger));
        }
}


sub getDocument {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::WorkAreaJPanel::document;
}


# throws Exception
sub toDocument {
    my ($self) = @_;
        $org::allbinary::graphics::j2me::workarea::WorkAreaJPanel::document = 'org::allbinary::dom::DomHelper'->getInstance()->createDocument();
        my $workAreaNode = $org::allbinary::graphics::j2me::workarea::WorkAreaJPanel::document->createElement($org::allbinary::graphics::j2me::workarea::WorkAreaDom::WORKAREA);
        my $nameNode = $org::allbinary::graphics::j2me::workarea::WorkAreaJPanel::document->createElement($org::allbinary::graphics::j2me::workarea::WorkAreaDom::NAME);
        my $nameTextNode = $org::allbinary::graphics::j2me::workarea::WorkAreaJPanel::document->createTextNode($self->{name});
        $nameNode->appendChild($nameTextNode);
        my $framesNode = $org::allbinary::graphics::j2me::workarea::WorkAreaJPanel::document->createElement($org::allbinary::graphics::j2me::workarea::WorkAreaDom::FRAMES);
        my $size = $self->{canvasJPanelList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $canvasJPanel = $self->{canvasJPanelList}->get($index);
            $framesNode->appendChild($canvasJPanel->toDom());
        }
        $workAreaNode->appendChild($nameNode);
        $workAreaNode->appendChild($framesNode);
        $org::allbinary::graphics::j2me::workarea::WorkAreaJPanel::document->appendChild($workAreaNode);
        return $document;
}


sub initComponents {
    my ($self) = @_;
        $self->{innerJPanel} = 'javax::swing::JPanel'->new();
        $self->setLayout('java::awt::GridLayout'->new(1, 1));
        $self->{innerJPanel}->addKeyListener(do {
            package java::awt::event::KeyAdapter::AnonymousN73492 { our @ISA = ('java::awt::event::KeyAdapter');
            

            sub keyTyped {
                my ($self, $evt) = @_;
                $self->innerJPanelKeyTyped($evt);
            }
            

            sub keyPressed {
                my ($self, $evt) = @_;
                $self->innerJPanelKeyPressed($evt);
            }
            

            sub keyReleased {
                my ($self, $evt) = @_;
                $self->innerJPanelKeyReleased($evt);
            }
            }
            'java::awt::event::KeyAdapter::AnonymousN73492'->can('new') ? 'java::awt::event::KeyAdapter::AnonymousN73492'->new() : bless({}, 'java::awt::event::KeyAdapter::AnonymousN73492')
        });
        $self->add($self->{innerJPanel});
}


sub innerJPanelKeyReleased {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Key Pressed1");
}


sub innerJPanelKeyPressed {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Key Pressed2");
}


sub innerJPanelKeyTyped {
    my ($self, $evt) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Key Pressed3");
}


sub keyPressed {
    my ($self, $keyEvent) = @_;
        $self->getCurrentFrame()->keyPressed($keyEvent);
}


sub keyReleased {
    my ($self, $keyEvent) = @_;
}


sub keyTyped {
    my ($self, $keyEvent) = @_;
}


sub delete {
    my ($self, $evt) = @_;
        my $canvasJPanelHashMap = $self->getCanvasHashMap();
        if ($canvasJPanelHashMap->containsKey($evt->getTreeNode())) {
            $self->{canvasHolderJPanel}->removeAll();
            my $frameInt = $canvasJPanelHashMap->get($evt->getTreeNode());
            $self->{canvasJPanelList}->remove(int($frameInt));
            $self->select(int($frameInt));
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub duplicate {
    my ($self, $evt) = @_;
        $self->duplicate($evt->getTreeNode());
}


# Java overloaded method: Perl keeps the last definition
sub select {
    my ($self, $evt) = @_;
        $self->select($evt->getTreeNode());
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Frame Selected");
}


sub rotate {
    my ($self, $evt) = @_;
        my $canvasJPanelHashMap = $self->getCanvasHashMap();
        my $treeNode = $evt->getTreeNode();
        my $frameInt = $canvasJPanelHashMap->get($evt->getTreeNode());
        my $canvasJPanel = $self->{canvasJPanelList}->get(int($frameInt));
        if (defined($canvasJPanel)) {
            $canvasJPanel->addAngle($evt->getAngle());
            $self->select(int($frameInt));
        }
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Canvas Rotated");
}


sub explode {
    my ($self, $evt) = @_;
        $self->explodeAll();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub autoExplode {
    my ($self, $evt) = @_;
        $self->autoExplode(10, 0);
}


# throws Exception
sub center {
    my ($self) = @_;
        my $canvasJPanel = $self->getCurrentFrame();
        $canvasJPanel->center();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub center {
    my ($self, $evt) = @_;
        $self->center();
}


sub run {
    my ($self) = @_;
        try {
            while (1) {
                if ($self->isPlaying()) {
                    my $size = $self->{canvasJPanelList}->size();
                    for (my $index = 0; $index < $size; $index++) {
                        if (!$self->isPlaying()) {
                            last;
                        }
                        $self->select($index);
                        Time::HiRes::sleep((100) / 1000);
                    }
                } else {
                    Time::HiRes::sleep((500) / 1000);
                }
                Time::HiRes::sleep((250) / 1000);
            }
        } catch ($e) {
        }
}

# use java::awt;
# use java::util::EventListener;
use java::util::HashMap;
# use java::util::LinkedList;
# use javax::swing;
# use javax::swing::tree::MutableTreeNode;
use org::allbinary::dom::DomHelper;
use org::allbinary::graphics::j2me::StatusFactory;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasDom;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventListener;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService;
use org::allbinary::graphics::j2me::workarea::properties::PropertiesJPanel;
use org::allbinary::graphics::j2me::workarea::tools::ToolJPanel;
use org::allbinary::log::LOGGING;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::graphics::j2me::workarea::JPanel;
use org::allbinary::graphics::j2me::workarea::WorkAreaJPanelInterface;
use org::allbinary::graphics::j2me::workarea::WorkAreaJTreeJPanel;
use org::allbinary::graphics::j2me::workarea::GridLayout;
use org::allbinary::graphics::j2me::workarea::GridBagLayout;
use org::allbinary::graphics::j2me::workarea::GridBagConstraints;
use org::allbinary::graphics::j2me::workarea::WorkAreaDom;
use java::lang::Thread;

1;

