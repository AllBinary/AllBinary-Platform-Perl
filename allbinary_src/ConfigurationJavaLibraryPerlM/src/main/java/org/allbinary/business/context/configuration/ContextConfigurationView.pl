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

package org::allbinary::business::context::configuration::ContextConfigurationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{contextConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of ContextConfigurationView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $childNodeList = $node->getChildNodes();
        $self->{contextConfigurationInterface} = 'org::allbinary::business::context::configuration::ContextConfiguration'->new();
        my $emailConfigurationNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::NAME, $childNodeList);
        my $emailServerConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationView'->new($emailConfigurationNode);
        $self->{contextConfigurationInterface}->setEmailServerConfigurationInterface($emailServerConfigurationView->getEmailConfigurationInterface());
    return $self;
}


sub _new1 {
    my ($class, $contextConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{contextConfigurationInterface} = $contextConfigurationInterface;
    return $self;
}


sub getContextConfigurationInterface {
    my ($self) = @_;
        return $self->{contextConfigurationInterface};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement('org::allbinary::business::context::configuration::ContextConfigurationData'->getInstance()->{NAME});
        my $emailServerConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationView'->new($self->getContextConfigurationInterface()->getEmailServerConfigurationInterface());
        $node->appendChild($emailServerConfigurationView->toXmlNode($document));
        return $node;
}

use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationInterface;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationView;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::business::context::configuration::ContextConfiguration;
use org::allbinary::business::context::configuration::ContextConfigurationData;

1;

