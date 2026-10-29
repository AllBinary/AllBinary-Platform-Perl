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

package org::allbinary::game::score::HighScoreNamePersistanceSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::score::HighScoreNamePersistanceSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{platformRecordIdUtil} = 'org::allbinary::persistance::PlatformRecordIdUtil'->getInstance();
    $self->{RECORD_ID} = "_SN";
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{nameBasicArrayList} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::score::HighScoreNamePersistanceSingleton::SINGLETON;
}


sub clear {
    my ($self) = @_;
        $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


# throws Exception
sub deleteAll {
    my ($self, $abeClientInformation, $gameInfo) = @_;
        my $size = $self->{nameBasicArrayList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $integer = $self->{nameBasicArrayList}->{objectArray}->[$index];
            $self->delete($abeClientInformation, $gameInfo, int($integer));
        }
        $self->clear();
}


sub getRecordId {
    my ($self, $abeClientInformation) = @_;
        return $self->{platformRecordIdUtil}->getRecordId($abeClientInformation, $self->{RECORD_ID});
}


# throws Exception
sub delete {
    my ($self, $abeClientInformation, $gameInfo, $deleteId) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Deleting: ")->appendint($deleteId)->toString(), $self, $self->{commonStrings}->{delete});
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
            $recordStore->deleteRecord($deleteId);
        } catch ($e) {
            die $e;
        } finally {
            if (defined($recordStore)) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("Closing RecordStore", $self, $self->{commonStrings}->{delete});
                $recordStore->closeRecordStore();
            }
        }
}


sub getIds {
    my ($self) = @_;
        return $self->{nameBasicArrayList};
}


sub load {
    my ($self, $abeClientInformation, $gameInfo) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            if ($self->{name} eq 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) {
                my $LOADING_ID = "Loading id: ";
                $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
                my $recordEnum = $recordStore->enumerateRecords($org::allbinary::game::configuration::persistance::NullRecordFilter::NULL_RECORD_FILTER, $org::allbinary::game::configuration::persistance::NullRecordComparator::NULL_RECORD_COMPARATOR, 1);
                my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
                my $recordAsBytes = undef;
                my $byteArrayInputStream = undef;
                my $inputStream = undef;
                while ($recordEnum->hasNextElement()) {
                    my $id = $recordEnum->nextRecordId();
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($LOADING_ID)->appendint($id)->toString(), $self, $self->{commonStrings}->{LOAD});
                    $recordAsBytes = $self->{tsUtil}->getRecord($recordStore, $id);
                    $byteArrayInputStream = 'java::io::ByteArrayInputStream'->new($recordAsBytes);
                    $inputStream = 'java::io::DataInputStream'->new($byteArrayInputStream);
                    while ($inputStream->available() > 0) {
                        $self->{name} = $inputStream->readUTF();
                    }
                    $self->{nameBasicArrayList}->add($smallIntegerSingletonFactory->getAt($id));
                }
            }
        } catch ($e) {
            $self->save($abeClientInformation, $gameInfo, $self->{name});
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{EXCEPTION_LABEL})->append('org::allbinary::logic::java::exception::ExceptionUtil'->getInstance()->getStackTrace($e))->toString(), $self, $self->{commonStrings}->{LOAD});
        } finally {
            try {
                if (defined($recordStore)) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("Closing RecordStore", $self, $self->{commonStrings}->{LOAD});
                    $recordStore->closeRecordStore();
                }
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{LOAD}, $e);
            }
        }
        return $self->{name};
}


sub save {
    my ($self, $abeClientInformation, $gameInfo, $name) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Saving: ")->append($name)->toString(), $self, $self->{commonStrings}->{SAVE});
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
            my $byteArrayOutputStream = 'java::io::ByteArrayOutputStream'->new();
            my $outputStream = 'java::io::DataOutputStream'->new($byteArrayOutputStream);
            $outputStream->writeUTF($name);
            my $savedGameBytes = $byteArrayOutputStream->toByteArray();
            $recordStore->addRecord($savedGameBytes, 0, scalar(@{$savedGameBytes}));
            $self->{name} = $name;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{SAVE}, $e);
        } finally {
            try {
                if (defined($recordStore)) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("Closing RecordStore", $self, $self->{commonStrings}->{SAVE});
                    $recordStore->closeRecordStore();
                }
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{SAVE}, $e);
            }
        }
}

# use java::io::ByteArrayInputStream;
# use java::io::ByteArrayOutputStream;
# use java::io::DataInputStream;
# use java::io::DataOutputStream;
# use javax::microedition::rms::RecordEnumeration;
# use javax::microedition::rms::RecordStore;
# use javax::microedition::rms::RecordStoreException;
use org::allbinary::TsUtil;
use org::allbinary::game::GameInfo;
use org::allbinary::game::configuration::persistance::NullRecordComparator;
use org::allbinary::game::configuration::persistance::NullRecordFilter;
use org::allbinary::game::configuration::persistance::NullRecordStore;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::java::exception::ExceptionUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::persistance::PlatformRecordIdUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

