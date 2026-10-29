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

package org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{emailServerConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of EmailServerConfigurationView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $childNodeList = $node->getChildNodes();
        my $server = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::SERVER, $childNodeList);
        my $accountName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::ACCOUNT, $childNodeList);
        my $password = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::PASSWORD, $childNodeList);
        $self->{emailServerConfigurationInterface} = 'org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfiguration'->new($accountName, $password, $server);
    return $self;
}


sub _new1 {
    my ($class, $emailServerConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{emailServerConfigurationInterface} = $emailServerConfigurationInterface;
    return $self;
}


sub getEmailConfigurationInterface {
    my ($self) = @_;
        return $self->{emailServerConfigurationInterface};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $emailConfigurationMapping = 'org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationMapping'->new($self->{emailServerConfigurationInterface});
        my $hashMap = $emailConfigurationMapping->toHashMap();
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData::NAME, $hashMap);
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfiguration;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationMapping;

1;

