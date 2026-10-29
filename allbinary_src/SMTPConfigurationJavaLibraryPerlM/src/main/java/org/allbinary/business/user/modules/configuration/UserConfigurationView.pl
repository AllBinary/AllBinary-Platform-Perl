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

package org::allbinary::business::user::modules::configuration::UserConfigurationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{userConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserConfigurationView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userConfigurationInterface} = 'org::allbinary::business::user::modules::configuration::UserConfiguration'->new();
        my $childNodeList = $node->getChildNodes();
        my $emailConfigurationNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationData::NAME, $childNodeList);
        my $userEmailConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationView'->new($emailConfigurationNode);
        my $userEmailConfigurationInterface = $userEmailConfigurationView->getEmailConfigurationInterface();
        $self->{userConfigurationInterface}->setUserEmailConfigurationInterface($userEmailConfigurationInterface);
        my $timeCreatedNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED}, $childNodeList);
        my $timeCreatedView = 'org::allbinary::business::time::created::TimeCreatedView'->new($timeCreatedNode);
        $self->{userConfigurationInterface}->setTimeCreated($timeCreatedView->getTimeCreated());
        my $timeLastModifiedNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $childNodeList);
        my $timeLastModifiedView = 'org::allbinary::business::time::modified::TimeLastModifiedView'->new($timeLastModifiedNode);
        $self->{userConfigurationInterface}->setTimeLastModified($timeLastModifiedView->getTimeLastModified());
    return $self;
}


sub _new1 {
    my ($class, $userConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userConfigurationInterface} = $userConfigurationInterface;
    return $self;
}


sub getUserConfigurationInterface {
    my ($self) = @_;
        return $self->{userConfigurationInterface};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::business::user::modules::configuration::UserConfigurationData::NAME);
        my $userEmailConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationView'->new($self->{userConfigurationInterface}->getUserEmailConfigurationInterface());
        $node->appendChild($userEmailConfigurationView->toXmlNode($document));
        my $timeCreatedView = 'org::allbinary::business::time::created::TimeCreatedView'->new($self->{userConfigurationInterface}->getTimeCreated());
        $node->appendChild($timeCreatedView->toXmlNode($document));
        my $timeLastModifiedView = 'org::allbinary::business::time::modified::TimeLastModifiedView'->new($self->{userConfigurationInterface}->getTimeLastModified());
        $node->appendChild($timeLastModifiedView->toXmlNode($document));
        return $node;
}

use org::allbinary::business::entry::EntryData;
use org::allbinary::business::time::created::TimeCreatedView;
use org::allbinary::business::time::modified::TimeLastModifiedView;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationData;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationInterface;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationView;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::business::user::modules::configuration::UserConfiguration;
use org::allbinary::business::user::modules::configuration::UserConfigurationData;

1;

