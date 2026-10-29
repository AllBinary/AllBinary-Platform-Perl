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

package org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::actions::script::condition::processors::output::BasicProfileActionScriptOutput','org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputInterface';

our $NAME = "Captures";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{saved} = 0;
    $self->{display} = 0;
    $self->{imageTypes} = undef;
    $self->{actionScriptOutputJPanel} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of ImageActionScriptOutput takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new($NAME, $node);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::NAME, $node->getChildNodes());
        if (defined($actionNode)) {
            my $nodeList = $actionNode->getChildNodes();
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $childNode = $nodeList->item($index);
                if ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::SAVE) == 0) {
                    my $booleanString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->setSaved($booleanString);
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::DISPLAY) == 0) {
                    my $booleanString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->setSaved($booleanString);
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::TYPES) == 0) {
                    $self->setImageTypes('org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes'->new($childNode));
                } else {
                    die ("Action Script Output Unknown Node");
                }
            }
        } else {
            die ("Action Script Output Node Null");
        }
        $self->setAllowsChildren(0);
        $self->{actionScriptOutputJPanel} = 'org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputJPanel'->new($self);
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new($NAME);
    $self->_init_fields();
        # super(...) made $self above
        $self->setImageTypes('org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes'->new());
        $self->setAllowsChildren(0);
        $self->{actionScriptOutputJPanel} = 'org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputJPanel'->new($self);
    return $self;
}


sub getActionScriptOutputJPanel {
    my ($self) = @_;
        return $self->{actionScriptOutputJPanel};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::DISPLAY, ("" . ($self->isDisplay())));
        $hashMap->put($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::SAVE, ("" . ($self->isSaved())));
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $self->SUPER::toXmlNode($document);
        my $newNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::NAME, $self->toHashMap());
        $newNode->appendChild($self->getImageTypes()->toXmlNode($document));
        $node->appendChild($newNode);
        return $node;
}


# throws Exception
sub process {
    my ($self, $frame) = @_;
        'org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputProcessor'->process($self, $frame);
}


sub showDialog {
    my ($self) = @_;
        $self->{actionScriptOutputJPanel}->getCapturedImageActionJDialog()->setVisible(1);
}


sub isSaved {
    my ($self) = @_;
        return $self->{saved};
}


sub setSaved {
    my ($self, $saved) = @_;
        $self->{saved} = $saved;
}


sub isDisplay {
    my ($self) = @_;
        return $self->{display};
}


sub setDisplay {
    my ($self, $display) = @_;
        $self->{display} = $display;
}


sub future_toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(" Is Save: ");
        $stringBuffer->appendboolean($self->isSaved());
        $stringBuffer->append(" Is Display: ");
        $stringBuffer->appendboolean($self->isDisplay());
        $stringBuffer->append(" ");
        $stringBuffer->append($self->getImageTypes()->toString());
        return $stringBuffer->toString();
}


sub log {
    my ($self) = @_;
        $self->{logUtil}->putF($self->future_toString(), $self, "log");
}


sub getImageTypes {
    my ($self) = @_;
        return $self->{imageTypes};
}


sub setImageTypes {
    my ($self, $imageTypes) = @_;
        $self->{imageTypes} = $imageTypes;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::BasicProfileActionScriptOutput;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputInterface;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputJPanel;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputProcessor;

1;

