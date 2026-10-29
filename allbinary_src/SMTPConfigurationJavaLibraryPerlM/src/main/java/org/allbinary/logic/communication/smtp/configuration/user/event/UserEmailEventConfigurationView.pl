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

package org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{userEmailEventConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserEmailEventConfigurationView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $childNodeList = $node->getChildNodes();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $name = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::NAME, $childNodeList);
        $hashMap->put($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::NAME, $name);
        my $eventListenerClassPath = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::LISTENER_CLASSPATH, $childNodeList);
        $hashMap->put($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::LISTENER_CLASSPATH, $eventListenerClassPath);
        $self->setUserEmailEventConfigurationInterface('org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfiguration'->new($hashMap));
    return $self;
}


sub _new1 {
    my ($class, $userEmailEventConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setUserEmailEventConfigurationInterface($userEmailEventConfigurationInterface);
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $userEmailEventConfigurationMapping = 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationMapping'->new($self->getUserEmailEventConfigurationInterface());
        my $hashMap = $userEmailEventConfigurationMapping->toHashMap();
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::NAME, $hashMap);
        return $node;
}


sub getUserEmailEventConfigurationInterface {
    my ($self) = @_;
        return $self->{userEmailEventConfigurationInterface};
}


sub setUserEmailEventConfigurationInterface {
    my ($self, $userEmailEventConfigurationInterface) = @_;
        $self->{userEmailEventConfigurationInterface} = $userEmailEventConfigurationInterface;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfiguration;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationMapping;

1;

