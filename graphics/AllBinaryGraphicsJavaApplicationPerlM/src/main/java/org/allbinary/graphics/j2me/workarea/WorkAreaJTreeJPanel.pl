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

package org::allbinary::graphics::j2me::workarea::WorkAreaJTreeJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{rootTreeNode} = undef;
    $self->{workAreaJTree} = undef;
    $self->{highlightedBasicArrayList} = undef;
    $self->{copyJMenuItem} = undef;
    $self->{deleteJMenuItem} = undef;
    $self->{itemJPopupMenu} = undef;
    $self->{itemJScrollPane1} = undef;
    $self->{rotateJMenuItem} = undef;
    $self->{workAreaPropertiesJPanel} = undef;
}


sub new {
    my ($class, $workAreaName) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
        $self->{rootTreeNode} = 'javax::swing::tree::DefaultMutableTreeNode'->new($workAreaName);
        $self->{workAreaPropertiesJPanel}->removeAll();
        $self->updateTree();
        $self->{highlightedBasicArrayList} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub add {
    my ($self, $treeNode) = @_;
        $self->{rootTreeNode}->add($treeNode);
}


sub updateTree {
    my ($self) = @_;
        $self->{workAreaJTree} = 'org::allbinary::graphics::j2me::workarea::JTree'->new($self->{rootTreeNode});
        $self->{workAreaJTree}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN66641 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->workAreaJTreeMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN66641'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN66641'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN66641')
        });
        $self->{workAreaPropertiesJPanel}->removeAll();
        $self->{workAreaPropertiesJPanel}->add($self->{workAreaJTree});
}


sub getNode {
    my ($self, $treePathArray) = @_;
        my $basicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
        if (defined($treePathArray)) {
            for (my $index = 0; $index < scalar(@{$treePathArray}); $index++) {
                $basicArrayList->add($self->getNode($treePathArray->[$index]));
            }
        }
        return $basicArrayList;
}


# Java overloaded method: Perl keeps the last definition
sub getNode {
    my ($self, $treePath) = @_;
        if (defined($treePath)) {
            my $obj = $treePath->getPath();
            if (defined($obj)) {
                my $node = $obj->[scalar(@{$obj}) - 1];
                return $node;
            }
        }
        return undef;
}


# throws Exception
sub deselectAll {
    my ($self) = @_;
        my $size = $self->{highlightedBasicArrayList}->size();
        $self->{logUtil}->putF("size: " . $size, $self, "deselectAll");
        for (my $index = 0; $index < $size; $index++) {
            my $node = $self->{highlightedBasicArrayList}->get($index);
            'org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService'->fire('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent'->new('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventSource'->new($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::DESELECT, $node)));
        }
        $self->{highlightedBasicArrayList}->clear();
}


# throws Exception
sub selectGraphicItem {
    my ($self, $node) = @_;
        $self->{highlightedBasicArrayList}->add($node);
        'org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService'->fire('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent'->new('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventSource'->new($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::SELECT, $node)));
}


# throws Exception
sub removeGraphicItem {
    my ($self, $node) = @_;
        'org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService'->fire('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent'->new('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventSource'->new($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::DELETE, $node)));
}


# throws Exception
sub removeCanvas {
    my ($self, $node) = @_;
        'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->fire('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent'->new('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource'->new($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::DELETE, $node)));
}


# throws Exception
sub remove {
    my ($self, $treePath) = @_;
        my $node = $self->getNode($treePath);
        if (defined($node)) {
            if ((Scalar::Util::blessed($node->getUserObject()) && $node->getUserObject()->isa('org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel'))) {
                $self->removeCanvas($node);
            } else {
                $self->removeGraphicItem($node);
            }
        }
        my $parent = $node->getParent();
        $parent->remove($node);
}


# throws Exception
sub copy {
    my ($self) = @_;
        my $treePath = $self->{workAreaJTree}->getSelectionPath();
        $self->copy($treePath);
        $self->updateTree();
        $self->expand();
        $self->repaint();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub copy {
    my ($self, $treePath) = @_;
        my $node = $self->getNode($treePath);
        if (defined($node)) {
            if ((Scalar::Util::blessed($node->getUserObject()) && $node->getUserObject()->isa('org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel'))) {
                'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->fire('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent'->new('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource'->new($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::DUPLICATE, $node)));
            } else {
                'org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService'->fire('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent'->new('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventSource'->new($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::DUPLICATE, $node)));
            }
        }
}


# throws Exception
sub rotate {
    my ($self, $treePath, $angle) = @_;
        my $node = $self->getNode($treePath);
        if (defined($node)) {
            if ((Scalar::Util::blessed($node->getUserObject()) && $node->getUserObject()->isa('org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel'))) {
                'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->fire('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent'->new('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource'->new($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::ROTATE, $angle, $node)));
            } else {
                'org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService'->fire('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent'->new('org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventSource'->new($org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService::ROTATE, $angle, $node)));
            }
        }
}


sub getRootTreeNode {
    my ($self) = @_;
        return $self->{rootTreeNode};
}


sub expand {
    my ($self) = @_;
        $self->{workAreaJTree}->expandRow(0);
        $self->{workAreaJTree}->expandRow(1);
}


# Java overloaded method: Perl keeps the last definition
sub expand {
    my ($self, $treePath) = @_;
        $self->{workAreaJTree}->expandPath($treePath);
}


sub initComponents {
    my ($self) = @_;
        $self->{itemJPopupMenu} = 'javax::swing::JPopupMenu'->new();
        $self->{deleteJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{copyJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{rotateJMenuItem} = 'javax::swing::JMenuItem'->new();
        $self->{itemJScrollPane1} = 'javax::swing::JScrollPane'->new();
        $self->{workAreaPropertiesJPanel} = 'javax::swing::JPanel'->new();
        $self->{itemJPopupMenu}->addPopupMenuListener(do {
            package javax::swing::event::PopupMenuListener::AnonymousN69955 { our @ISA = ('javax::swing::event::PopupMenuListener');
            

            sub popupMenuCanceled {
                my ($self, $evt) = @_;
            }
            

            sub popupMenuWillBecomeInvisible {
                my ($self, $evt) = @_;
                $self->itemJPopupMenuPopupMenuWillBecomeInvisible($evt);
            }
            

            sub popupMenuWillBecomeVisible {
                my ($self, $evt) = @_;
                $self->itemJPopupMenuPopupMenuWillBecomeVisible($evt);
            }
            }
            'javax::swing::event::PopupMenuListener::AnonymousN69955'->can('new') ? 'javax::swing::event::PopupMenuListener::AnonymousN69955'->new() : bless({}, 'javax::swing::event::PopupMenuListener::AnonymousN69955')
        });
        $self->{deleteJMenuItem}->setText("Delete");
        $self->{deleteJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70299 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->deleteJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70299'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70299'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70299')
        });
        $self->{itemJPopupMenu}->add($self->{deleteJMenuItem});
        $self->{copyJMenuItem}->setText("Copy");
        $self->{copyJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70523 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->copyJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70523'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70523'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70523')
        });
        $self->{itemJPopupMenu}->add($self->{copyJMenuItem});
        $self->{rotateJMenuItem}->setText("Rotate 45*");
        $self->{rotateJMenuItem}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70747 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->rotateJMenuItemMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70747'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70747'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70747')
        });
        $self->{itemJPopupMenu}->add($self->{rotateJMenuItem});
        $self->setLayout('java::awt::GridLayout'->new(1, 1));
        $self->{workAreaPropertiesJPanel}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN70995 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mousePressed {
                my ($self, $evt) = @_;
                $self->workAreaPropertiesJPanelMousePressed($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN70995'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN70995'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN70995')
        });
        $self->{workAreaPropertiesJPanel}->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{itemJScrollPane1}->setViewportView($self->{workAreaPropertiesJPanel});
        $self->add($self->{itemJScrollPane1});
}


sub rotateJMenuItemMousePressed {
    my ($self, $evt) = @_;
        try {
            my $treePath = $self->{workAreaJTree}->getSelectionPath();
            $self->rotate($treePath, 45);
            $self->updateTree();
            $self->expand();
            $self->repaint();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "rotateJMenuItemMousePressed", $e);
        }
}


sub workAreaJTreeMousePressed {
    my ($self, $evt) = @_;
        try {
            my $selectedTreePathArray = $self->{workAreaJTree}->getSelectionPaths();
            my $list = $self->getNode($selectedTreePathArray);
            if ($list->size() > 0) {
                if (($evt->getModifiers() & $evt->{BUTTON3_MASK}) == $evt->{BUTTON3_MASK}) {
                    for (my $index = 0; $index < scalar(@{$selectedTreePathArray}); $index++) {
                        my $defaultMutableTreeNode = $list->get($index);
                        if ((Scalar::Util::blessed($defaultMutableTreeNode->getUserObject()) && $defaultMutableTreeNode->getUserObject()->isa('org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel'))) {
                            $self->{itemJPopupMenu}->show($self, $evt->getX(), $evt->getY());
                        } else {
                            $self->{itemJPopupMenu}->show($self, $evt->getX(), $evt->getY());
                        }
                    }
                }
                if (($evt->getModifiers() & $evt->{BUTTON1_MASK}) == $evt->{BUTTON1_MASK}) {
                    $self->deselectAll();
                    for (my $index = 0; $index < scalar(@{$selectedTreePathArray}); $index++) {
                        my $defaultMutableTreeNode = $list->get($index);
                        if ((Scalar::Util::blessed($defaultMutableTreeNode->getUserObject()) && $defaultMutableTreeNode->getUserObject()->isa('org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel'))) {
                            'org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService'->fire('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent'->new('org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource'->new($org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService::SELECT, $defaultMutableTreeNode)));
                        } else {
                            $self->selectGraphicItem($defaultMutableTreeNode);
                        }
                    }
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "workAreaJTreeMousePressed", $e);
        }
}


sub itemJPopupMenuPopupMenuWillBecomeInvisible {
    my ($self, $evt) = @_;
}


sub itemJPopupMenuPopupMenuWillBecomeVisible {
    my ($self, $evt) = @_;
}


sub copyJMenuItemMousePressed {
    my ($self, $evt) = @_;
        try {
            $self->copy();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "copyJMenuItemMousePressed", $e);
        }
}


sub deleteJMenuItemMousePressed {
    my ($self, $evt) = @_;
        try {
            my $selectedTreePathArray = $self->{workAreaJTree}->getSelectionPaths();
            for (my $index = 0; $index < scalar(@{$selectedTreePathArray}); $index++) {
                my $treePath = $selectedTreePathArray->[$index];
                $self->remove($treePath);
                $self->updateTree();
                $self->expand();
                $self->repaint();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "deleteJMenuItemMousePressed", $e);
        }
}


sub workAreaPropertiesJPanelMousePressed {
    my ($self, $evt) = @_;
}

# use javax::swing;
# use javax::swing::tree::DefaultMutableTreeNode;
# use javax::swing::tree::MutableTreeNode;
# use javax::swing::tree::TreePath;
use org::allbinary::graphics::j2me::workarea::canvas::CanvasTreeLabel;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEvent;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventService;
use org::allbinary::graphics::j2me::workarea::canvas::event::MyCanvasEventSource;
use org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent;
use org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventService;
use org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventSource;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::j2me::workarea::JTree;

1;

