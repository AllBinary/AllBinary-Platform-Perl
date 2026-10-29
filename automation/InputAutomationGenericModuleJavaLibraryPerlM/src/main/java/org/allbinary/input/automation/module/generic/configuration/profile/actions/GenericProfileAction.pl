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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileAction;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{name} = undef;
    $self->{genericProfileActionScript} = undef;
    $self->{genericProfileActionJPanel} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of GenericProfileAction takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $genericProfileActionJPanel, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $actionNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::NAME, $node->getChildNodes());
        if (defined($actionNameNode)) {
            $self->{name} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($actionNameNode);
        } else {
            die ("Profile Action Name Node Null");
        }
        $self->setGenericProfileActionScript('org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScript'->new($self->{genericProfileActionJPanel}, $node));
    return $self;
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->setGenericProfileActionScript('org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScript'->new($self->{genericProfileActionJPanel}));
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::NAME, $self->{name});
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::NAME, $self->toHashMap());
        $node->appendChild($self->getGenericProfileActionScript()->toXmlNode($document));
        return $node;
}


sub getGenericProfileActionScript {
    my ($self) = @_;
        return $self->{genericProfileActionScript};
}


sub setGenericProfileActionScript {
    my ($self, $genericProfileActionScript) = @_;
        $self->{genericProfileActionScript} = $genericProfileActionScript;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScript;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData;

1;

