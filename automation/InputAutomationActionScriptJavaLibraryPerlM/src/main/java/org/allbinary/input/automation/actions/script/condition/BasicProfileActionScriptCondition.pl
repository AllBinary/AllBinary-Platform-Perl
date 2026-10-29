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

package org::allbinary::input::automation::actions::script::condition::BasicProfileActionScriptCondition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'org::allbinary::input::automation::actions::script::ProfileActionScriptItem','org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{profileActionProcessorInterfaceVector} = undef;
    $self->{profileActionConditionInterfaceVector} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of BasicProfileActionScriptCondition takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $label, $node) = @_;
    my $self = $class->SUPER::new($label, $node);
    $self->_init_fields();
        # super(...) made $self above
        $self->init();
        my $nodeList = $node->getChildNodes();
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $actionItemNode = $nodeList->item($index);
            if ($actionItemNode->getNodeType() == $org::w3c::dom::Node::ELEMENT_NODE) {
                if ($actionItemNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::GenericProfileActionScriptConditionData::NAME) == 0) {
                    $self->addCondition('org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionFactory'->getInstance($actionItemNode));
                } elsif ($actionItemNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::NAME) == 0) {
                    $self->addProcessor('org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputFactory'->getInstance($actionItemNode));
                } elsif ($actionItemNode->getNodeName()->compareTo($org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData::NAME) == 0) {
                    $self->addProcessor('org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputFactory'->getInstance($actionItemNode));
                }
            }
        }
    return $self;
}


# throws Exception
sub addProcessorNodes {
    my ($self, $node) = @_;
        my $nodeList = $node->getChildNodes();
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $processorActionItemNode = $nodeList->item($index);
            if ($processorActionItemNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::NAME) == 0) {
                $self->addProcessor('org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputFactory'->getInstance($processorActionItemNode));
            } elsif ($processorActionItemNode->getNodeName()->compareTo($org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData::NAME) == 0) {
                $self->addProcessor('org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputFactory'->getInstance($processorActionItemNode));
            }
        }
}


sub _new1 {
    my ($class, $label) = @_;
    my $self = $class->SUPER::new($label);
    $self->_init_fields();
        # super(...) made $self above
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->setProfileActionProcessorInterfaceVector('org::allbinary::util::BasicArrayListD'->new());
        $self->setProfileActionConditionInterfaceVector('org::allbinary::util::BasicArrayListD'->new());
        $self->getJPopupMenu()->add($self->getConditionJPopupMenu());
        $self->getJPopupMenu()->add($self->getInputJPopupMenu());
        $self->getJPopupMenu()->add($self->getOutputJPopupMenu());
}


sub getConditionJPopupMenu {
    my ($self) = @_;
        my $jMenu = 'org::allbinary::input::automation::actions::script::condition::JMenu'->new($self->{NEW_CONDITION});
        my $jMenuItemColorAt = 'org::allbinary::input::automation::actions::script::condition::JMenuItem'->new($self->{NEW_COLOR_AT});
        my $jMenuItemAlways = 'org::allbinary::input::automation::actions::script::condition::JMenuItem'->new($self->{NEW_ALWAYS});
        my $jMenuItemTimeInterval = 'org::allbinary::input::automation::actions::script::condition::JMenuItem'->new($self->{NEW_TIME_INTERVAL});
        $jMenuItemColorAt->addActionListener($self);
        $jMenuItemAlways->addActionListener($self);
        $jMenuItemTimeInterval->addActionListener($self);
        $jMenu->add($jMenuItemColorAt);
        $jMenu->add($jMenuItemAlways);
        $jMenu->add($jMenuItemTimeInterval);
        return $jMenu;
}


sub getInputJPopupMenu {
    my ($self) = @_;
        my $jMenu = 'org::allbinary::input::automation::actions::script::condition::JMenu'->new($self->{NEW_INPUT});
        my $jMenuItemKey = 'org::allbinary::input::automation::actions::script::condition::JMenuItem'->new($self->{NEW_KEY_INPUT});
        my $jMenuItemMouse = 'org::allbinary::input::automation::actions::script::condition::JMenuItem'->new($self->{NEW_MOUSE_INPUT});
        my $jMenuItemJoystick = 'org::allbinary::input::automation::actions::script::condition::JMenuItem'->new($self->{NEW_JOYSTICK_INPUT});
        $jMenuItemKey->addActionListener($self);
        $jMenuItemMouse->addActionListener($self);
        $jMenuItemJoystick->addActionListener($self);
        $jMenu->add($jMenuItemKey);
        $jMenu->add($jMenuItemMouse);
        $jMenu->add($jMenuItemJoystick);
        return $jMenu;
}


sub getOutputJPopupMenu {
    my ($self) = @_;
        my $jMenu = 'org::allbinary::input::automation::actions::script::condition::JMenu'->new($self->{NEW_OUTPUT});
        my $jMenuItemImage = 'org::allbinary::input::automation::actions::script::condition::JMenuItem'->new($self->{NEW_IMAGE_OUTPUT});
        $jMenuItemImage->addActionListener($self);
        $jMenu->add($jMenuItemImage);
        return $jMenu;
}


sub addProcessor {
    my ($self, $profileActionProcessorInterface) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "addInput");
        $self->getProfileActionProcessorInterfaceVector()->add($profileActionProcessorInterface);
        $self->add($profileActionProcessorInterface);
}


sub removeProcessor {
    my ($self, $profileActionProcessorInterface) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "removeInput");
        $self->getProfileActionProcessorInterfaceVector()->remove($profileActionProcessorInterface);
        $self->remove($profileActionProcessorInterface);
}


sub removeCondition {
    my ($self, $profileActionScriptNodeInterface) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "removeCondition");
        $self->getProfileActionConditionInterfaceVector()->remove($profileActionScriptNodeInterface);
        $self->remove($profileActionScriptNodeInterface);
}


sub addCondition {
    my ($self, $profileActionScriptNodeInterface) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "addCondition");
        $self->getProfileActionConditionInterfaceVector()->add($profileActionScriptNodeInterface);
        $self->add($profileActionScriptNodeInterface);
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::actions::script::condition::GenericProfileActionScriptConditionData::NAME);
        my $profileActionConditionInterfaceVector = $self->getProfileActionConditionInterfaceVector();
        my $size = $profileActionConditionInterfaceVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $profileActionConditionInterface = $profileActionConditionInterfaceVector->get($index);
            $node->appendChild($profileActionConditionInterface->toXmlNode($document));
        }
        my $profileActionProcessorInterfaceVector = $self->getProfileActionProcessorInterfaceVector();
        my $size2 = $profileActionProcessorInterfaceVector->size();
        for (my $index = 0; $index < $size2; $index++) {
            my $profileActionProcessorInterface = $profileActionProcessorInterfaceVector->get($index);
            $node->appendChild($profileActionProcessorInterface->toXmlNode($document));
        }
        return $node;
}


sub getProfileActionConditionInterfaceVector {
    my ($self) = @_;
        return $self->{profileActionConditionInterfaceVector};
}


sub setProfileActionConditionInterfaceVector {
    my ($self, $profileActionConditionInterfaceVector) = @_;
        $self->{profileActionConditionInterfaceVector} = $profileActionConditionInterfaceVector;
}


sub actionPerformed {
    my ($self, $actionEvent) = @_;
        try {
            $self->SUPER::actionPerformed($actionEvent);
            if ($actionEvent->getActionCommand()->compareTo($self->{DELETE}) == 0) {
                if ((Scalar::Util::blessed($self->getParent()) && $self->getParent()->isa('org::allbinary::input::automation::actions::script::ProfileActionScriptNodeInterface'))) {
                    my $profileActionScriptNodeInterface = $self->getParent();
                    $profileActionScriptNodeInterface->removeCondition($self);
                    'org::allbinary::input::automation::actions::script::JTreeInterfaceFactory'->getInstance()->getJTreeInterface()->updateJTree();
                }
            } elsif ($actionEvent->getActionCommand()->compareTo($self->{NEW_COLOR_AT}) == 0) {
                $self->addCondition('org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition'->new());
                $self->updateTree();
            } elsif ($actionEvent->getActionCommand()->compareTo($self->{NEW_ALWAYS}) == 0) {
                $self->addCondition('org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition'->new());
                $self->updateTree();
            } elsif ($actionEvent->getActionCommand()->compareTo($self->{NEW_TIME_INTERVAL}) == 0) {
                $self->addCondition('org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptCondition'->new());
                $self->updateTree();
            } elsif ($actionEvent->getActionCommand()->compareTo($self->{NEW_KEY_INPUT}) == 0) {
                $self->addProcessor('org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInput'->new());
                $self->updateTree();
            } elsif ($actionEvent->getActionCommand()->compareTo($self->{NEW_MOUSE_INPUT}) == 0) {
                $self->addProcessor('org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInput'->new());
                $self->updateTree();
            } elsif ($actionEvent->getActionCommand()->compareTo($self->{NEW_IMAGE_OUTPUT}) == 0) {
                $self->addProcessor('org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutput'->new());
                $self->updateTree();
            }
        } catch ($e) {
            $self->{logUtil}->put("Error", $self, "actionPerformed", $e);
        }
}


sub getProfileActionProcessorInterfaceVector {
    my ($self) = @_;
        return $self->{profileActionProcessorInterfaceVector};
}


sub setProfileActionProcessorInterfaceVector {
    my ($self, $profileActionProcessorInterfaceVector) = @_;
        $self->{profileActionProcessorInterfaceVector} = $profileActionProcessorInterfaceVector;
}


sub updateTree {
    my ($self) = @_;
        'org::allbinary::input::automation::actions::script::JTreeInterfaceFactory'->getInstance()->getJTreeInterface()->updateJTree();
        my $treePath = 'javax::swing::tree::TreePath'->new($self);
        'org::allbinary::input::automation::actions::script::JTreeInterfaceFactory'->getInstance()->getJTreeInterface()->getActionScriptJTree()->expandPath($treePath);
}


# throws Exception
sub shouldProcess {
    my ($self, $frame) = @_;
        my $profileActionConditionInterfaceVector = $self->getProfileActionConditionInterfaceVector();
        my $size = $profileActionConditionInterfaceVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $profileActionScriptConditionInterface = $profileActionConditionInterfaceVector->get($index);
            if (!$profileActionScriptConditionInterface->shouldProcess($frame)) {
                return 0;
            }
        }
        return 1;
}


# throws Exception
sub process {
    my ($self, $frame) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Start - Processing ")->appendint($self->getProfileActionProcessorInterfaceVector()->size())->append(" inputs")->toString(), $self, $self->{commonStrings}->{PROCESS});
        my $profileActionProcessorInterfaceVector = $self->getProfileActionProcessorInterfaceVector();
        my $size = $profileActionProcessorInterfaceVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $profileActionScriptProcessorInterface = $profileActionProcessorInterfaceVector->get($index);
            $profileActionScriptProcessorInterface->process($frame);
        }
}

# use java::awt::event::ActionEvent;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::swing;
# use javax::swing::tree::TreePath;
use org::allbinary::input::automation::actions::script::JTreeInterfaceFactory;
use org::allbinary::input::automation::actions::script::ProfileActionScriptItem;
use org::allbinary::input::automation::actions::script::ProfileActionScriptNodeInterface;
use org::allbinary::input::automation::actions::script::condition::processors::ProfileActionScriptProcessorInterface;
use org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInput;
use org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInput;
use org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputFactory;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::GenericProfileActionScriptOutputData;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutput;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface;
use org::allbinary::input::automation::actions::script::condition::GenericProfileActionScriptConditionData;
use org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionFactory;
use org::allbinary::input::automation::actions::script::condition::JMenu;
use org::allbinary::input::automation::actions::script::condition::JMenuItem;
use org::allbinary::input::automation::actions::script::condition::TimeIntervalActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition;

1;

