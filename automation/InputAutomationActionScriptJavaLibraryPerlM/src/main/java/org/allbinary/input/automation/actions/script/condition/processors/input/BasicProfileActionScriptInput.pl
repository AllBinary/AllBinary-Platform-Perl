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

package org::allbinary::input::automation::actions::script::condition::processors::input::BasicProfileActionScriptInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::processors::BasicProfileActionScriptProcessor','org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{inputRobotInterface} = undef;
    $self->{time} = 0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of BasicProfileActionScriptInput takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $label, $node) = @_;
    my $self = $class->SUPER::new($label, $node);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START} . $label, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::TYPE, $node->getChildNodes());
        my $inputTypeString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($actionNode);
        my $timeNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::DELAY, $node->getChildNodes());
        if (defined($timeNode)) {
            my $delayString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($timeNode);
            $self->setTime(int(("" . ($delayString))));
        } else {
            $self->setTime(0);
        }
        $self->setInputRobotInterface('org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get($inputTypeString));
    return $self;
}


sub _new1 {
    my ($class, $label) = @_;
    my $self = $class->SUPER::new($label);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START} . $label, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $inputRobotFactory = 'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance();
        my $hashtable = $inputRobotFactory->get();
        my $set = $hashtable->keySet();
        my $iterator = $set->iterator();
        $self->setInputRobotInterface($inputRobotFactory->get($iterator->next()));
        $self->setTime(0);
    return $self;
}


sub getTime {
    my ($self) = @_;
        return $self->{time};
}


sub setTime {
    my ($self, $time) = @_;
        $self->{time} = $time;
}


sub BasicProfileActionScriptInput_toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::TYPE, $self->getInputRobotInterface()->getName());
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::DELAY, ("" . ($self->getTime())));
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData::NAME, $self->BasicProfileActionScriptInput_toHashMap());
        return $node;
}


sub setInputRobotInterface {
    my ($self, $inputRobotInterface) = @_;
        $self->{inputRobotInterface} = $inputRobotInterface;
}


sub getInputRobotInterface {
    my ($self) = @_;
        return $self->{inputRobotInterface};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append(" Input Type: ");
        if (defined($self->getInputRobotInterface())) {
            $stringBuffer->append($self->getInputRobotInterface()->getName());
        } else {
            $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING});
        }
        $stringBuffer->append(" Time: ");
        $stringBuffer->appendlong($self->getTime());
        return $stringBuffer->toString();
}

use java::util::HashMap;
use java::util::Iterator;
# use java::util::Set;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::input::automation::actions::script::condition::processors::BasicProfileActionScriptProcessor;
use org::allbinary::input::automation::robot::InputRobotFactory;
use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::ABHashtable;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputInterface;
use org::allbinary::input::automation::actions::script::condition::processors::input::GenericProfileActionScriptInputData;

1;

