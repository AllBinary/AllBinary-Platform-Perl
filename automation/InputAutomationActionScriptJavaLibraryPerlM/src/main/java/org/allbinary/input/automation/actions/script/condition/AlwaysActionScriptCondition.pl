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

package org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::BasicProfileActionScriptCondition','org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionInterface';

our $NAME = "Always On/Off";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{alwaysActionScriptConditionJPanel} = undef;
    $self->{isOn} = 0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of AlwaysActionScriptCondition takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new($org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition::NAME, $node);
    $self->_init_fields();
        # super(...) made $self above
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionData::NAME, $node->getChildNodes());
        if (defined($actionNode)) {
            my $nodeList = $actionNode->getChildNodes();
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $childNode = $nodeList->item($index);
                if ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionData::IS_ON) == 0) {
                    my $booleanString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->setIsOn($booleanString);
                } else {
                    die ("Action Script Condition Unknown Node");
                }
            }
        } else {
            die ("Action Script Condition Node Null");
        }
        $self->init();
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new($org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptCondition::NAME);
    $self->_init_fields();
        # super(...) made $self above
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{alwaysActionScriptConditionJPanel} = 'org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionJPanel'->new($self);
}


sub isIsOn {
    my ($self) = @_;
        return $self->{isOn};
}


sub setIsOn {
    my ($self, $isOn) = @_;
        $self->{isOn} = $isOn;
}


sub showDialog {
    my ($self) = @_;
        $self->{alwaysActionScriptConditionJPanel}->getAlwaysActionJDialog()->setVisible(1);
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionData::IS_ON, ("" . ($self->isIsOn())));
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $self->SUPER::toXmlNode($document);
        $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionData::NAME, $self->toHashMap()));
        return $node;
}


# throws Exception
sub shouldProcess {
    my ($self, $frame) = @_;
        if ($self->isIsOn()) {
            return $self->SUPER::shouldProcess($frame);
        }
        return 0;
}


sub log {
    my ($self) = @_;
        $self->{logUtil}->putF("Is On: " . $self->isIsOn(), $self, "log");
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::actions::script::condition::BasicProfileActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionInterface;
use org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionData;
use org::allbinary::input::automation::actions::script::condition::AlwaysActionScriptConditionJPanel;

1;

