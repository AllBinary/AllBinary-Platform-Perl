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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScript;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::tree::DefaultMutableTreeNode','org::allbinary::input::automation::actions::script::ProfileActionScriptNodeInterface';

our $NAME = "Root";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{genericProfileActionJPanel} = undef;
    $self->{profileActionConditionInterfaceVector} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of GenericProfileActionScript takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $genericProfileActionJPanel, $node) = @_;
    my $self = $class->SUPER::new($NAME);
    $self->_init_fields();
        # super(...) made $self above
        $self->{genericProfileActionJPanel} = $genericProfileActionJPanel;
        $self->setProfileActionConditionInterfaceVector('org::allbinary::util::BasicArrayListD'->new());
        my $actionScriptNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::SCRIPT, $node->getChildNodes());
        if (defined($actionScriptNode)) {
            my $nodeList = $actionScriptNode->getChildNodes();
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $actionConditionNode = $nodeList->item($index);
                if ($actionConditionNode->getNodeType() == $org::w3c::dom::Node::ELEMENT_NODE) {
                    $self->addCondition('org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionFactory'->getInstance($actionConditionNode));
                }
            }
        } else {
            die ("Profile Action Script Node Null");
        }
    return $self;
}


sub _new1 {
    my ($class, $genericProfileActionJPanel) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{genericProfileActionJPanel} = $genericProfileActionJPanel;
        $self->setProfileActionConditionInterfaceVector('org::allbinary::util::BasicArrayListD'->new());
    return $self;
}


sub addCondition {
    my ($self, $profileActionScriptNodeInterface) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "addCondition");
        $self->getProfileActionConditionInterfaceVector()->add($profileActionScriptNodeInterface);
        $self->add($profileActionScriptNodeInterface);
}


sub removeCondition {
    my ($self, $profileActionScriptNodeInterface) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "removeCondition");
        $self->getProfileActionConditionInterfaceVector()->remove($profileActionScriptNodeInterface);
        $self->remove($profileActionScriptNodeInterface);
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


sub getProfileActionConditionInterfaceVector {
    my ($self) = @_;
        return $self->{profileActionConditionInterfaceVector};
}


sub setProfileActionConditionInterfaceVector {
    my ($self, $profileActionConditionInterfaceVector) = @_;
        $self->{profileActionConditionInterfaceVector} = $profileActionConditionInterfaceVector;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::SCRIPT);
        my $vector = $self->getProfileActionConditionInterfaceVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $profileActionConditionInterface = $vector->get($index);
            $node->appendChild($profileActionConditionInterface->toXmlNode($document));
        }
        return $node;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::swing::tree::DefaultMutableTreeNode;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::input::automation::actions::script::ProfileActionScriptNodeInterface;
use org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionFactory;
use org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionJPanel;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

