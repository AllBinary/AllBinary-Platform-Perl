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

package org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{userEmailConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserEmailConfigurationView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::configuration::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->{userEmailConfigurationInterface} = 'org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfiguration'->new();
        my $childNodeList = $node->getChildNodes();
        my $userEmailEventsConfigurationNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationData::NAME, $childNodeList);
        my $userEmailEventsConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationView'->new($userEmailEventsConfigurationNode);
        $self->{userEmailConfigurationInterface}->setUserEmailEventsConfigurationInterface($userEmailEventsConfigurationView->getUserEmailEventsConfigurationInterface());
    return $self;
}


sub _new1 {
    my ($class, $userEmailConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userEmailConfigurationInterface} = $userEmailConfigurationInterface;
    return $self;
}


sub getEmailConfigurationInterface {
    my ($self) = @_;
        return $self->{userEmailConfigurationInterface};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $emailConfigurationMapping = 'org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationMapping'->new($self->{userEmailConfigurationInterface});
        my $hashMap = $emailConfigurationMapping->toHashMap();
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationData::NAME, $hashMap);
        my $userEmailConfigurationInterface = $self->getEmailConfigurationInterface();
        my $userEmailEventsConfigurationInterface = $userEmailConfigurationInterface->getUserEmailEventsConfigurationInterface();
        my $userEmailEventsConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationView'->new($userEmailEventsConfigurationInterface);
        $node->appendChild($userEmailEventsConfigurationView->toXmlNode($document));
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationData;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationInterface;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationView;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfiguration;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationMapping;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationData;

1;

