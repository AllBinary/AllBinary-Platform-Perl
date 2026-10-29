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

package org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::processors::input::BasicProfileActionScriptInput','org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputInterface';

our $NAME = "Mouse";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{point} = undef;
    $self->{buttons} = 0;
    $self->{mouseActionScriptInputJPanel} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of MouseActionScriptInput takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new($NAME, $node);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{point} = 'org::allbinary::input::automation::actions::script::condition::processors::input::Point'->new();
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::NAME, $node->getChildNodes());
        if (defined($actionNode)) {
            my $nodeList = $actionNode->getChildNodes();
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $childNode = $nodeList->item($index);
                if ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::BUTTONS) == 0) {
                    my $buttons = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->setButtonClicks(int(("" . ($buttons))));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::MOVE) == 0) {
                    my $mouseXNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::MOVE_X, $childNode->getChildNodes());
                    my $mouseXString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($mouseXNode);
                    my $mouseXInteger = ("" . ($mouseXString));
                    my $mouseYNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::MOVE_Y, $childNode->getChildNodes());
                    my $mouseYString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($mouseYNode);
                    my $mouseYInteger = ("" . ($mouseYString));
                    my $newPoint = 'org::allbinary::input::automation::actions::script::condition::processors::input::Point'->new(int($mouseXInteger), int($mouseYInteger));
                    $self->setPoint($newPoint);
                } else {
                    die ("Action Script Input Unknown Node");
                }
            }
        } else {
            die ("Action Script Input Node Null");
        }
        $self->setAllowsChildren(0);
        $self->{mouseActionScriptInputJPanel} = 'org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputJPanel'->new($self);
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new($NAME);
    $self->_init_fields();
        # super(...) made $self above
        $self->{point} = 'org::allbinary::input::automation::actions::script::condition::processors::input::Point'->new();
        $self->setAllowsChildren(0);
        $self->{mouseActionScriptInputJPanel} = 'org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputJPanel'->new($self);
    return $self;
}


sub setPoint {
    my ($self, $point) = @_;
        $self->{point} = $point;
}


sub getPoint {
    my ($self) = @_;
        return $self->{point};
}


sub getButtonClicks {
    my ($self) = @_;
        return $self->{buttons};
}


sub setButtonClicks {
    my ($self, $buttons) = @_;
        $self->{buttons} = $buttons;
}


sub showDialog {
    my ($self) = @_;
        $self->{mouseActionScriptInputJPanel}->getMouseActionJDialog()->setVisible(1);
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::BUTTONS, ("" . ($self->getButtonClicks())));
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $self->SUPER::toXmlNode($document);
        my $mouseNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::NAME, $self->toHashMap());
        $node->appendChild($mouseNode);
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::MOVE_X, ("" . ($self->getPoint()->{x})));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::MOVE_Y, ("" . ($self->getPoint()->{y})));
        $mouseNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData::MOVE, $hashMap));
        return $node;
}


# throws Exception
sub process {
    my ($self, $frame) = @_;
        'org::allbinary::input::automation::actions::script::condition::processors::input::MouseInputAutomationProcessor'->process($self);
}


sub log {
    my ($self) = @_;
        my $buttonStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $buttonStringBuffer->append("1: ");
        my $booleanFactory = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
        if (($self->getButtonClicks() & $java::awt::event::InputEvent::BUTTON1_MASK) != 0) {
            $buttonStringBuffer->append($booleanFactory->{TRUE_STRING});
        } else {
            $buttonStringBuffer->append($booleanFactory->{FALSE_STRING});
        }
        $buttonStringBuffer->append(" 2: ");
        if (($self->getButtonClicks() & $java::awt::event::InputEvent::BUTTON2_MASK) != 0) {
            $buttonStringBuffer->append($booleanFactory->{TRUE_STRING});
        } else {
            $buttonStringBuffer->append($booleanFactory->{FALSE_STRING});
        }
        $buttonStringBuffer->append(" 3: ");
        if (($self->getButtonClicks() & $java::awt::event::InputEvent::BUTTON3_MASK) != 0) {
            $buttonStringBuffer->append($booleanFactory->{TRUE_STRING});
        } else {
            $buttonStringBuffer->append($booleanFactory->{FALSE_STRING});
        }
        $self->{logUtil}->putF("Input Type: " . $self->getInputRobotInterface()->getName() . " Point: " . $self->getPoint() . " Buttons Clicked: " . $buttonStringBuffer->toString(), $self, "log");
}

# use java::awt;
# use java::awt::event::InputEvent;
use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::string::StringMaker;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::actions::script::condition::processors::input::BasicProfileActionScriptInput;
use org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputInterface;
use org::allbinary::input::automation::actions::script::condition::processors::input::Point;
use org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputData;
use org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputJPanel;
use org::allbinary::input::automation::actions::script::condition::processors::input::MouseInputAutomationProcessor;

1;

