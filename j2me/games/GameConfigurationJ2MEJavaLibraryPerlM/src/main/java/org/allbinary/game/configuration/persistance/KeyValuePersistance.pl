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

package org::allbinary::game::configuration::persistance::KeyValuePersistance;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::configuration::persistance::BasicPersitance';


sub _init_fields {
    my ($self) = @_;
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
}


sub new {
    my ($class, $recordId) = @_;
    my $self = $class->SUPER::new($recordId);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub loadAll {
    my ($self, $abeClientInformation) = @_;
        $self->loadAllSize($abeClientInformation, 1);
}


# throws Exception
sub loadAllSize {
    my ($self, $abeClientInformation, $size) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
            my $recordEnum = $recordStore->enumerateRecords($org::allbinary::game::configuration::persistance::NullRecordFilter::NULL_RECORD_FILTER, $org::allbinary::game::configuration::persistance::NullRecordComparator::NULL_RECORD_COMPARATOR, 1);
            my $hashtable = undef;
            my $name = undef;
            my $value = undef;
            my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
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
                    $hashtable = 'org::allbinary::util::ABHashtable'->new();
                    for (my $index = 0; $index < $size; $index++) {
                        $name = $inputStream->readUTF();
                        $inputStream->readUTF();
                        $value = $inputStream->readUTF();
                        $hashtable->put($name, $value);
                    }
                    $self->{valueList}->add($hashtable);
                    $self->{idList}->add($smallIntegerSingletonFactory->getAt($id));
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
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{persistanceStrings}->{SAVING})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($hashtable))->toString(), $self, $self->{commonStrings}->{SAVE});
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
            my $byteArrayOutputStream = 'java::io::ByteArrayOutputStream'->new();
            my $outputStream = 'java::io::DataOutputStream'->new($byteArrayOutputStream);
            my $value = undef;
            my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
            my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($hashtable);
            my $anyType = undef;
            my $size = scalar(@{$objectArray});
            for (my $index = 0; $index < $size; $index++) {
                $outputStream->writeUTF($objectArray->[$index]);
                $outputStream->writeUTF($commonSeps->{EQUALS});
                $anyType = $objectArray->[$index];
                $value = $hashtable->get($anyType);
                $outputStream->writeUTF($value);
            }
            my $tsUtil = 'org::allbinary::TsUtil'->getInstance();
            my $savedGameBytes = $tsUtil->getByteArray($byteArrayOutputStream->toString());
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


sub get {
    my ($self, $index) = @_;
        my $hashtable = $self->{valueList}->{objectArray}->[$index];
        return $hashtable;
}

# use java::io::ByteArrayInputStream;
# use java::io::ByteArrayOutputStream;
# use java::io::DataInputStream;
# use java::io::DataOutputStream;
# use javax::microedition::rms::RecordEnumeration;
# use javax::microedition::rms::RecordStore;
use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::HashtableUtil;
use org::allbinary::game::configuration::persistance::BasicPersitance;
use org::allbinary::game::configuration::persistance::NullRecordStore;
use org::allbinary::game::configuration::persistance::NullRecordFilter;
use org::allbinary::game::configuration::persistance::NullRecordComparator;

1;

