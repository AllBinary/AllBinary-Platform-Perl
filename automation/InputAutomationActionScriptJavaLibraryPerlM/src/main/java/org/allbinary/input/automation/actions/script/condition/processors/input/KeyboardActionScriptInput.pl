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

package org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::processors::input::BasicProfileActionScriptInput','org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputInterface';

our $NAME = "Keyboard";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{keyArray} = ['org::allbinary::input::KeySingletonFactory'->getInstance($java::awt::event::KeyEvent::VK_0)];
    $self->{keyboardActionScriptInputJPanel} = undef;
    $self->{press} = 0;
    $self->{release} = 0;
    $self->{delayBetweenKeys} = 0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of KeyboardActionScriptInput takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new($NAME, $node);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::NAME, $node->getChildNodes());
        if (defined($actionNode)) {
            my $nodeList = $actionNode->getChildNodes();
            my $vector = 'org::allbinary::util::BasicArrayListD'->new();
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $childNode = $nodeList->item($index);
                if ($childNode->getNodeName()->startsWith($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::KEY)) {
                    my $keyString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $vector->add(("" . ($keyString)));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::DELAY_BETWEEN_KEYS) == 0) {
                    my $time = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->setDelayBetweenKeys(int(("" . ($time))));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::PRESS) == 0) {
                    my $value = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->setPress(("" . ($value)));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::RELEASE) == 0) {
                    my $value = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->setRelease(("" . ($value)));
                } else {
                    die ("Action Script Input Unknown Node");
                }
            }
            $self->setKeyArray($vector->toArrayType([(undef) x ($vector->size())]));
        } else {
            die ("Action Script Input Node Null");
        }
        $self->setAllowsChildren(0);
        if (!$self->isPress() && !$self->isRelease()) {
            $self->setNormal();
        }
        $self->{keyboardActionScriptInputJPanel} = 'org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputJPanel'->new($self);
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new($NAME);
    $self->_init_fields();
        # super(...) made $self above
        if (!$self->isPress() && !$self->isRelease()) {
            $self->setNormal();
        }
        $self->setAllowsChildren(0);
        $self->setTime(120);
        $self->{keyboardActionScriptInputJPanel} = 'org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputJPanel'->new($self);
    return $self;
}


sub getDelayBetweenKeys {
    my ($self) = @_;
        return $self->{delayBetweenKeys};
}


sub setDelayBetweenKeys {
    my ($self, $delayBetweenKeys) = @_;
        $self->{delayBetweenKeys} = $delayBetweenKeys;
}


sub isPress {
    my ($self) = @_;
        return $self->{press};
}


sub setPress {
    my ($self, $press) = @_;
        $self->{press} = $press;
}


sub isRelease {
    my ($self) = @_;
        return $self->{release};
}


sub setRelease {
    my ($self, $release) = @_;
        $self->{release} = $release;
}


sub isNormal {
    my ($self) = @_;
        return $self->isRelease() && $self->isPress();
}


sub setNormal {
    my ($self) = @_;
        $self->setPress(1);
        $self->setRelease(1);
}


sub getKeyArray {
    my ($self) = @_;
        return $self->{keyArray};
}


sub setKeyArray {
    my ($self, $keyArray) = @_;
        if (defined($keyArray)) {
            $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} + scalar(@{$keyArray}), $self, "setKeyArray");
        }
        $self->{keyArray} = $keyArray;
}


sub showDialog {
    my ($self) = @_;
        $self->{keyboardActionScriptInputJPanel}->getKeyActionJDialog()->setVisible(1);
}


sub getText {
    my ($self) = @_;
        return $self->getText($self->getKeyArray());
}


sub setText {
    my ($self, $text) = @_;
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} . $text, $self, "setText");
        my $integerArray = $self->integerArrayValue($text);
        $self->setKeyArray($integerArray);
}


# Java overloaded method: Perl keeps the last definition
sub getText {
    my ($class, $integerArray) = @_;
        my $index = 0;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        while ($index < scalar(@{$integerArray})) {
            my $nextInteger = $integerArray->[$index];
            if ('org::allbinary::input::KeyUtil'->isNormallyDisplayed($nextInteger)) {
                $stringBuffer->append('java::awt::event::KeyEvent'->getKeyText($nextInteger));
            } else {
                $stringBuffer->append("&#" . $nextInteger . ";");
            }
            $index++;
        }
        return $stringBuffer->toString();
}


sub integerArrayValue {
    my ($self, $text) = @_;
        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} . $text, $self, "integerArrayValue");
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        my $index = 0;
        while ($index < length($text)) {
            my $aChar = substr($text, $index, 1);
            if ($aChar eq "&") {
                if (substr($text, $index + 1, 1) eq "#") {
                    my $endIndex = index($text, ";", $index + 1);
                    if ($endIndex != -1) {
                        my $nextCharString = substr($text, $index + 2, ($endIndex) - ($index + 2));
                        $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{NEXT} . " Char String: " . $nextCharString, $self, "integerArrayValue");
                        $vector->add(("" . (substr($nextCharString, $index, (length($nextCharString)) - ($index)))));
                        $index = $index + length($nextCharString) + 3;
                        next;
                    }
                }
            }
            $vector->add('org::allbinary::input::KeySingletonFactory'->getHashtable()->get(("" . ($aChar))));
            $index++;
        }
        my $integerArray = $vector->toArrayType([(undef) x ($vector->size())]);
        return $integerArray;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        for (my $index = 0; $index < scalar(@{$self->getKeyArray()}); $index++) {
            $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::KEY + $index, ("" . ($self->getKeyArray()->[$index])));
        }
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::DELAY_BETWEEN_KEYS, ("" . ($self->getDelayBetweenKeys())));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::PRESS, ("" . ($self->isPress())));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::RELEASE, ("" . ($self->isRelease())));
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $self->SUPER::toXmlNode($document);
        $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData::NAME, $self->toHashMap()));
        return $node;
}


# throws Exception
sub process {
    my ($self, $frame) = @_;
        'org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardInputAutomationProcessor'->process($self);
}


sub log {
    my ($self) = @_;
        $self->{logUtil}->putF($self->toString(), $self, "log");
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append(" Text: ");
        $stringBuffer->append($self->getText());
        $stringBuffer->append(" isPress: ");
        $stringBuffer->appendboolean($self->isPress());
        $stringBuffer->append(" isRelease: ");
        $stringBuffer->appendboolean($self->isRelease());
        $stringBuffer->append(" Between Key Delay: ");
        $stringBuffer->appendint($self->getDelayBetweenKeys());
        return $stringBuffer->toString();
}

# use java::awt::event::KeyEvent;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::input::KeySingletonFactory;
use org::allbinary::input::KeyUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::actions::script::condition::processors::input::BasicProfileActionScriptInput;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputInterface;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputJPanel;
use org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardInputAutomationProcessor;

1;

