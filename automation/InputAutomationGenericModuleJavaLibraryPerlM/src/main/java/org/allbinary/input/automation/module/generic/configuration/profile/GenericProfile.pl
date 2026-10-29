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

package org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{name} = undef;
    $self->{vector} = undef;
    $self->{genericProfileActions} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of GenericProfile takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName('org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($node));
        $self->{vector} = 'org::allbinary::util::BasicArrayListD'->new();
        my $nodeList = $node->getChildNodes();
        $self->{logUtil}->putF("Name: " . $self->getName() . " Child Nodes: " . $nodeList->getLength(), $self, "Contructor");
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $profileNode = $nodeList->item($index);
            if ($profileNode->getNodeName()->compareTo($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerData::NAME) == 0) {
                my $genericProfileDataWorkerType = 'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType'->getInstance($profileNode);
                $self->{logUtil}->putF("Adding GenericProfileDataWorkerType: " . $genericProfileDataWorkerType->toString(), $self, "Contructor");
                $self->{vector}->add($genericProfileDataWorkerType);
            }
        }
    return $self;
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->{vector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub getGenericProfileDataWorkerTypeVector {
    my ($self) = @_;
        return $self->{vector};
}


sub add {
    my ($self, $genericProfileDataWorkerType) = @_;
        if (!$self->{vector}->contains($genericProfileDataWorkerType)) {
            $self->{vector}->add($genericProfileDataWorkerType);
        }
}


sub remove {
    my ($self, $genericProfileDataWorkerType) = @_;
        $self->{vector}->remove($genericProfileDataWorkerType);
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileData::NAME, $self->{name});
        my $size = $self->{vector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $genericProfileDataWorkerType = $self->{vector}->get($index);
            $node->appendChild($genericProfileDataWorkerType->toXmlNode($document));
        }
        return $node;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getGenericProfileActions {
    my ($self) = @_;
        return $self->{genericProfileActions};
}


sub setGenericProfileActions {
    my ($self, $genericProfileActions) = @_;
        $self->{genericProfileActions} = $genericProfileActions;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActions;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerData;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileData;

1;

