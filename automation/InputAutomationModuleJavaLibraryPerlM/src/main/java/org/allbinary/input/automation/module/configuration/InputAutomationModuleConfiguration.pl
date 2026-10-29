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

package org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{className} = undef;
    $self->{name} = undef;
    $self->{inputAutomationModuleInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of InputAutomationModuleConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new2 {
    my ($class, $abeClientInformation, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($abeClientInformation, $node);
    return $self;
}


sub _new3 {
    my ($class, $abeClientInformation, $name, $className) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->setClassName($className);
        $self->init($abeClientInformation);
    return $self;
}


sub _new1 {
    my ($class, $inputAutomationModuleInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setInputAutomationModuleInterface($inputAutomationModuleInterface);
        $self->setClassName(ref($self->{inputAutomationModuleInterface}));
    return $self;
}


# throws Exception
sub init {
    my ($self, $abeClientInformation, $node) = @_;
        my $nodeList = $node->getChildNodes();
        if (defined($nodeList)) {
            my $classNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::DynamicObjectData::NAME, $nodeList);
            if (defined($classNameNode)) {
                $self->setClassName('org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($classNameNode));
                $self->init($abeClientInformation);
            } else {
                $self->{logUtil}->putF("Class Node Null", $self, $self->{commonStrings}->{INIT});
            }
        } else {
            $self->{logUtil}->putF($org::allbinary::input::automation::InputAutomationData::NAME . " Node Has No Children", $self, "Contructor");
        }
}


# Java overloaded method: Perl keeps the last definition
sub init {
    my ($self, $abeClientInformation) = @_;
        try {
            $self->{logUtil}->putF("Name: " . $self->getName(), $self, $self->{commonStrings}->{INIT});
            $self->{logUtil}->putF("ClassName: " . $self->{className}, $self, $self->{commonStrings}->{INIT});
            $self->setInputAutomationModuleInterface('org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance()->getInstance($abeClientInformation, $self->getClassName()));
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
            die ("RuntimeException");
        }
}


# throws Exception
sub toDomNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::module::InputAutomationModuleData::NAME);
        my $classNameNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::business::DynamicObjectData::NAME, $self->getClassName());
        $node->appendChild($classNameNode);
        return $node;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{logUtil}->putF("Name: " . $name, $self, "setName");
        $self->{name} = $name;
}


sub getClassName {
    my ($self) = @_;
        return $self->{className};
}


sub setClassName {
    my ($self, $className) = @_;
        $self->{logUtil}->putF("ClassName : " . $className, $self, "setClassName");
        $self->{className} = $className;
}


sub getInputAutomationModuleInterface {
    my ($self) = @_;
        return $self->{inputAutomationModuleInterface};
}


sub setInputAutomationModuleInterface {
    my ($self, $inputAutomationModuleInterface) = @_;
        $self->{logUtil}->putF("InputAutomationModuleFactoryInterface : " . $inputAutomationModuleInterface, $self, "setInputAutomationModuleInterface");
        $self->{inputAutomationModuleInterface} = $inputAutomationModuleInterface;
        $self->setName($self->{inputAutomationModuleInterface}->getName());
}

# use javax::xml::bind::annotation::XmlAccessType;
# use javax::xml::bind::annotation::XmlAccessorType;
# use javax::xml::bind::annotation::XmlElement;
# use javax::xml::bind::annotation::XmlRootElement;
# use javax::xml::bind::annotation::XmlType;
use org::allbinary::business::DynamicObjectData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::input::automation::InputAutomationData;
use org::allbinary::input::automation::module::InputAutomationModuleData;
use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::loader::AbeFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

