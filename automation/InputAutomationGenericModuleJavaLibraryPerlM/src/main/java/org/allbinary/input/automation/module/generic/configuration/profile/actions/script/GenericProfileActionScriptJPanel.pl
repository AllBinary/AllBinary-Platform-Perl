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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScriptJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'javax::swing::JPanel','org::allbinary::input::automation::actions::script::JTreeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{defaultMutableTreeNode} = 'javax::swing::tree::DefaultMutableTreeNode'->new("Root");
    $self->{genericProfileActionScript} = undef;
    $self->{actionScriptJTree} = undef;
    $self->{jScrollPane1} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->initComponents();
    return $self;
}


sub updateJTree {
    my ($self) = @_;
        my $defaultTreeModel = 'javax::swing::tree::DefaultTreeModel'->new($self->getGenericProfileActionScript());
        $self->getActionScriptJTree()->setModel($defaultTreeModel);
        $self->repaint();
        $self->{logUtil}->putF("Updated UI", $self, "updateJTree");
}


sub getGenericProfileActionScript {
    my ($self) = @_;
        return $self->{genericProfileActionScript};
}


sub setGenericProfileActionScript {
    my ($self, $genericProfileActionScript) = @_;
        $self->{genericProfileActionScript} = $genericProfileActionScript;
}


sub getActionScriptJTree {
    my ($self) = @_;
        return $self->{actionScriptJTree};
}


sub setActionScriptJTree {
    my ($self, $actionScriptJTree) = @_;
        $self->{actionScriptJTree} = $actionScriptJTree;
}


sub initComponents {
    my ($self) = @_;
        $self->{jScrollPane1} = 'javax::swing::JScrollPane'->new();
        $self->{actionScriptJTree} = 'javax::swing::JTree'->new();
        $self->setLayout('java::awt::GridLayout'->new(1, 0));
        $self->{actionScriptJTree}->setPreferredSize('java::awt::Dimension'->new(500, 500));
        $self->{actionScriptJTree}->addMouseListener(do {
            package java::awt::event::MouseAdapter::AnonymousN66880 { our @ISA = ('java::awt::event::MouseAdapter');
            

            sub mouseClicked {
                my ($self, $evt) = @_;
                $self->actionScriptJTreeMouseClicked($evt);
            }
            

            sub mouseReleased {
                my ($self, $evt) = @_;
                $self->actionScriptJTreeMouseReleased($evt);
            }
            }
            'java::awt::event::MouseAdapter::AnonymousN66880'->can('new') ? 'java::awt::event::MouseAdapter::AnonymousN66880'->new() : bless({}, 'java::awt::event::MouseAdapter::AnonymousN66880')
        });
        $self->{jScrollPane1}->setViewportView($self->{actionScriptJTree});
        $self->add($self->{jScrollPane1});
}


sub actionScriptJTreeMouseReleased {
    my ($self, $evt) = @_;
        my $button = $evt->getButton();
        if ($button == $java::awt::event::MouseEvent::BUTTON3) {
            my $treePath = $self->getActionScriptJTree()->getSelectionPath();
            if (defined($treePath)) {
                my $anyType = $treePath->getLastPathComponent();
                if ((Scalar::Util::blessed($anyType) && $anyType->isa('org::allbinary::input::automation::actions::script::condition::CustomTreeNodeInterface'))) {
                    my $customTreeNodeInterface = $anyType;
                    my $jPopupMenu = $customTreeNodeInterface->getJPopupMenu();
                    $jPopupMenu->show($evt->getSource(), $evt->getX(), $evt->getY());
                }
            }
        }
}


sub actionScriptJTreeMouseClicked {
    my ($self, $evt) = @_;
}

# use java::awt::event::MouseEvent;
# use javax::swing;
# use javax::swing::tree::DefaultMutableTreeNode;
# use javax::swing::tree::DefaultTreeModel;
# use javax::swing::tree::TreePath;
use org::allbinary::input::automation::actions::script::JTreeInterface;
use org::allbinary::input::automation::actions::script::condition::CustomTreeNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

