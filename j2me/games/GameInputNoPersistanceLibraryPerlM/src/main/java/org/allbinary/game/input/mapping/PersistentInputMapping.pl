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

#GameInputNoPersistanceLibrary
package org::allbinary::game::input::mapping::PersistentInputMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
    $self->{inputMapping} = 'org::allbinary::game::input::mapping::InputToGameKeyMapping'->new();
    $self->{inputMappingEventListenerInterface} = $org::allbinary::game::input::mapping::event::NullInputMappingEventListener::NULL_INPUT_MAPPING_EVENT_LISTENER;
    $self->{inputPersistance} = undef;
    $self->{inputMappingEvent} = 'org::allbinary::game::input::mapping::event::InputMappingEvent'->new($self);
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::mapping::PersistentInputMapping::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::mapping::PersistentInputMapping::instance = 'org::allbinary::game::input::mapping::PersistentInputMapping'->new('org::allbinary::game::configuration::persistance::GamePersistanceStrings'->getInstance()->{SAVED_INPUT_CONFIGURATION_RECORD_ID});
        }
        return $org::allbinary::game::input::mapping::PersistentInputMapping::instance;
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{inputPersistance} = 'org::allbinary::game::input::InputPersistance'->new($name);
    return $self;
}


sub getTotalMapped {
    my ($self) = @_;
        return $self->getInputMapping()->getHashtable()->size();
}


sub isDefaultNew {
    my ($self) = @_;
        return 0;
}


sub getDefault {
    my ($self) = @_;
        return 'org::allbinary::game::input::mapping::InputToGameKeyMapping'->getNullInstance();
}


# throws Exception
sub setDefault {
    my ($self, $abeClientInformation) = @_;
        $self->getInputMapping()->removeAll();
        $self->getInputMapping()->addMapping($self->getDefault());
        $self->save($abeClientInformation);
}


# throws Exception
sub update {
    my ($self, $abeClientInformation) = @_;
        $self->{inputPersistance}->deleteAll($abeClientInformation);
        $self->save($abeClientInformation);
}


# throws Exception
sub save {
    my ($self, $abeClientInformation) = @_;
        $self->{inputPersistance}->save($abeClientInformation, $self->getInputMapping()->getHashtable());
        $self->{inputMappingEvent}->setInputToGameKeyMapping($self->getInputMapping());
        if (defined($self->getInputMappingEventListenerInterface())) {
            $self->getInputMappingEventListenerInterface()->onInputMappingEvent($self->{inputMappingEvent});
        }
}


# throws Exception
sub init {
    my ($self, $abeClientInformation) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{INIT});
        try {
            $self->{inputPersistance}->loadAll($abeClientInformation);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
            $self->{inputPersistance}->deleteRecoreStore($abeClientInformation);
            $self->setDefault($abeClientInformation);
            $self->{inputPersistance}->loadAll($abeClientInformation);
        }
        my $list = $self->{inputPersistance}->getList();
        my $totalMappedTo = 0;
        my $size = $list->size();
        my $hashtable = undef;
        my $enumeration = undef;
        my $mappedToInput = undef;
        my $gameActionInput = undef;
        for (my $index = 0; $index < $size; $index++) {
            $hashtable = $list->{objectArray}->[$index];
            $enumeration = $hashtable->keys();
            while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
                $mappedToInput = $self->{enumerationUtil}->nextElement($enumeration);
                $gameActionInput = $hashtable->get($mappedToInput);
                $totalMappedTo++;
                $self->getInputMapping()->add($gameActionInput, $mappedToInput);
            }
        }
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("End - Total Loaded Keys Mapped: ");
        $stringBuffer->appendint($self->getTotalMapped());
        $stringBuffer->append(" to: ");
        $stringBuffer->appendint($totalMappedTo);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{INIT});
}


sub setInputMappingEventListenerInterface {
    my ($self, $inputMappingEventListenerInterface) = @_;
        $self->{inputMappingEventListenerInterface} = $inputMappingEventListenerInterface;
}


sub getInputMappingEventListenerInterface {
    my ($self) = @_;
        return $self->{inputMappingEventListenerInterface};
}


sub getInputMapping {
    my ($self) = @_;
        return $self->{inputMapping};
}


# throws Exception
sub isDelete {
    my ($self, $input) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub isSystemInput {
    my ($self, $input) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}

use java::util::Enumeration;
use org::allbinary::game::configuration::persistance::GamePersistanceStrings;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputPersistance;
use org::allbinary::game::input::mapping::event::InputMappingEvent;
use org::allbinary::game::input::mapping::event::InputMappingEventListenerInterface;
use org::allbinary::game::input::mapping::event::NullInputMappingEventListener;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::EnumerationUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::input::mapping::InputToGameKeyMapping;

1;

