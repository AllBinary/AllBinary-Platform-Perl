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

#GameInputPersistanceLibrary
package org::allbinary::game::input::InputPersistance;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::configuration::persistance::BasicPersitance';


sub _init_fields {
    my ($self) = @_;
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{hashtableUtil} = 'org::allbinary::util::HashtableUtil'->getInstance();
}


sub new {
    my ($class, $name) = @_;
    my $self = $class->SUPER::new($name);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub loadAll {
    my ($self, $abeClientInformation) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
            my $recordEnum = $recordStore->enumerateRecords($org::allbinary::game::configuration::persistance::NullRecordFilter::NULL_RECORD_FILTER, $org::allbinary::game::configuration::persistance::NullRecordComparator::NULL_RECORD_COMPARATOR, 1);
            my $gameActionInputId = 0;
            my $inputId = 0;
            my $gameActionInput = undef;
            my $input = undef;
            my $hashtable = undef;
            my $gameKeyFactory = 'org::allbinary::game::input::GameKeyMappingFactory'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $inputFactory = 'org::allbinary::game::input::InputFactory'->getInstance();
            my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
            my $stdUtil = 'org::allbinary::logic::StdUtil'->getInstance();
            my $recordAsBytes = undef;
            my $byteArrayInputStream = undef;
            my $inputStream = undef;
            while ($recordEnum->hasNextElement()) {
                my $id = $recordEnum->nextRecordId();
                $stringBuffer->delete(0, $stringBuffer->length());
                $self->{logUtil}->putF($stringBuffer->append($self->{persistanceStrings}->{LOADING_ID})->appendint($id)->toString(), $self, $self->{persistanceStrings}->{LOAD_ALL});
                $recordAsBytes = $self->{tsUtil}->getRecord($recordStore, $id);
                if (defined($recordAsBytes)) {
                    $byteArrayInputStream = 'java::io::ByteArrayInputStream'->new($recordAsBytes);
                    $inputStream = 'java::io::DataInputStream'->new($byteArrayInputStream);
                    $hashtable = $stdUtil->createHashtable();
                    my $value = 0;
                    while ($inputStream->available() > 0) {
                        my $gameActionInputIdAsString = $inputStream->readUTF();
                        $value = int($gameActionInputIdAsString);
                        $gameActionInputId = $value;
                        $inputStream->readUTF();
                        $value = int($inputStream->readUTF());
                        $inputId = $value;
                        $gameActionInput = $gameKeyFactory->getGameKey($gameActionInputId);
                        $input = $inputFactory->getInstanceById($inputId);
                        if ($input == $inputFactory->{NO_INPUT} || !defined($gameActionInput)) {
                            $stringBuffer->delete(0, $stringBuffer->length());
                            if ($input == $inputFactory->{NO_INPUT}) {
                                $stringBuffer->append($self->{persistanceStrings}->{ERROR_LOADING_ID});
                                $stringBuffer->appendlong($inputId);
                                $stringBuffer->append($self->{persistanceStrings}->{GAME_ACTION_INPUT});
                                $stringBuffer->appendlong($gameActionInputId);
                                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, $self->{persistanceStrings}->{LOAD_ALL});
                            }
                            if (!defined($gameActionInput)) {
                                $stringBuffer->delete(0, $stringBuffer->length());
                                $stringBuffer->append($self->{persistanceStrings}->{ERROR_LOADING});
                                $stringBuffer->appendlong($gameActionInputId);
                                $stringBuffer->append($self->{persistanceStrings}->{ID});
                                $stringBuffer->appendlong($inputId);
                                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, $self->{persistanceStrings}->{LOAD_ALL});
                            }
                        } else {
                        }
                        $hashtable->put($input, $gameActionInput);
                    }
                    $self->{valueList}->add($hashtable);
                    $self->{idList}->add($smallIntegerSingletonFactory->getAt($id));
                } else {
                }
            }
        } catch ($e) {
            die $e;
        } finally {
            if (defined($recordStore)) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{persistanceStrings}->{CLOSING_RECORDSTORE}, $self, $self->{persistanceStrings}->{LOAD_ALL});
                $recordStore->closeRecordStore();
            }
        }
}


# throws Exception
sub save {
    my ($self, $abeClientInformation, $hashtable) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->append($self->{persistanceStrings}->{SAVING})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($hashtable))->toString(), $self, $self->{commonStrings}->{SAVE});
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
            my $byteArrayOutputStream = 'java::io::ByteArrayOutputStream'->new();
            my $outputStream = 'java::io::DataOutputStream'->new($byteArrayOutputStream);
            my $gameActionInput = undef;
            my $list = undef;
            my $input = undef;
            my $savedGameBytes = undef;
            my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
            my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
            my $inputObjectArray = $self->{hashtableUtil}->getKeysAsArray($hashtable);
            my $size = scalar(@{$inputObjectArray});
            for (my $index = 0; $index < $size; $index++) {
                $gameActionInput = $inputObjectArray->[$index];
                $list = $hashtable->get($inputObjectArray->[$index]);
                for (my $index2 = 0; $index2 < $list->size(); $index2++) {
                    my $gameActionInputIdAsString = $smallIntegerSingletonFactory->getAt($gameActionInput->getId())->toString();
                    $outputStream->writeUTF($gameActionInputIdAsString);
                    $outputStream->writeUTF($commonSeps->{EQUALS});
                    $input = $list->{objectArray}->[$index2];
                    my $inputIdAsString = $smallIntegerSingletonFactory->getAt($input->getId())->toString();
                    $outputStream->writeUTF($inputIdAsString);
                }
            }
            $savedGameBytes = $byteArrayOutputStream->toByteArray();
            $recordStore->addRecord($savedGameBytes, 0, scalar(@{$savedGameBytes}));
        } catch ($e) {
            die $e;
        } finally {
            if (defined($recordStore)) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{persistanceStrings}->{CLOSING_RECORDSTORE}, $self, $self->{commonStrings}->{SAVE});
                $recordStore->closeRecordStore();
            }
        }
}

# use java::io::ByteArrayInputStream;
# use java::io::ByteArrayOutputStream;
# use java::io::DataInputStream;
# use java::io::DataOutputStream;
# use javax::microedition::rms::RecordEnumeration;
# use javax::microedition::rms::RecordStore;
use org::allbinary::TsUtil;
use org::allbinary::game::configuration::persistance::BasicPersitance;
use org::allbinary::game::configuration::persistance::NullRecordComparator;
use org::allbinary::game::configuration::persistance::NullRecordFilter;
use org::allbinary::game::configuration::persistance::NullRecordStore;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::HashtableUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::input::GameKeyMappingFactory;
use org::allbinary::game::input::InputFactory;

1;

