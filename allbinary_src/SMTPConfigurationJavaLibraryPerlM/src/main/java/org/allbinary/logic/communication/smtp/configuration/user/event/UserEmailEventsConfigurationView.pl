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

package org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{userEmailEventsConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserEmailEventsConfigurationView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userEmailEventsConfigurationInterface} = 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfiguration'->new();
        my $childNodeList = $node->getChildNodes();
        my $emailEventConfigurationNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodesNoThrow($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::NAME, $childNodeList);
        my $size = $emailEventConfigurationNodeVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userEmailConfigurationNode = $emailEventConfigurationNodeVector->get($index);
            my $userEmailEventConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationView'->new($userEmailConfigurationNode);
            $self->{userEmailEventsConfigurationInterface}->addUserEmailEventConfiguration($userEmailEventConfigurationView->getUserEmailEventConfigurationInterface());
        }
    return $self;
}


sub _new1 {
    my ($class, $userEmailEventsConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userEmailEventsConfigurationInterface} = $userEmailEventsConfigurationInterface;
    return $self;
}


sub getUserEmailEventsConfigurationInterface {
    my ($self) = @_;
        return $self->{userEmailEventsConfigurationInterface};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $userEmailConfigurationMapping = 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationMapping'->new($self->{userEmailEventsConfigurationInterface});
        my $node = $document->createElement($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationData::NAME);
        my $emailEventHashMap = $self->getUserEmailEventsConfigurationInterface()->getEventConfigurationHashMap();
        my $set = $emailEventHashMap->keySet();
        if ($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::configuration::user::event::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            $self->{logUtil}->putF("Number Of Email Events Specified in file: " . $set->size(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        my $eventNameArray = $set->toArray();
        my $size = scalar(@{$eventNameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $eventName = $eventNameArray->[$index];
            my $userEmailEventsConfigurationInterface = $emailEventHashMap->get($eventName);
            my $userEmailEventConfigurationView = 'org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationView'->new($userEmailEventsConfigurationInterface);
            $node->appendChild($userEmailEventConfigurationView->toXmlNode($document));
        }
        return $node;
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfiguration;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationView;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationMapping;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationData;

1;

