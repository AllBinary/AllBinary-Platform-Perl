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

package org::allbinary::game::configuration::persistance::BasicPersitance;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{persistanceStrings} = 'org::allbinary::game::configuration::persistance::PersistanceStrings'->getInstance();
    $self->{platformRecordIdUtil} = 'org::allbinary::persistance::PlatformRecordIdUtil'->getInstance();
    $self->{recordId} = undef;
    $self->{valueList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{idList} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class, $recordId) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{recordId} = $recordId;
    return $self;
}


# throws Exception
sub deleteRecoreStore {
    my ($self, $abeClientInformation) = @_;
        'javax::microedition::rms::RecordStore'->deleteRecordStore($self->getRecordId($abeClientInformation));
}


# throws Exception
sub deleteAll {
    my ($self, $abeClientInformation) = @_;
        my $size = $self->{idList}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $integer = $self->{idList}->{objectArray}->[$index];
            $self->delete($abeClientInformation, int($integer));
        }
        $self->clear();
}


# throws Exception
sub delete {
    my ($self, $abeClientInformation, $deleteId) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{persistanceStrings}->{DELETING_WITH_ID})->appendint($deleteId)->toString(), $self, $self->{commonStrings}->{delete});
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
            $recordStore->deleteRecord($deleteId);
        } catch ($e) {
            die $e;
        } finally {
            if (defined($recordStore)) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{persistanceStrings}->{CLOSING_RECORDSTORE}, $self, $self->{commonStrings}->{delete});
                $recordStore->closeRecordStore();
            }
        }
}


sub getRecordId {
    my ($self, $abeClientInformation) = @_;
        return $self->{platformRecordIdUtil}->getRecordId($abeClientInformation, $self->{recordId});
}


sub getList {
    my ($self) = @_;
        return $self->{valueList};
}


sub getIds {
    my ($self) = @_;
        return $self->{idList};
}


sub clear {
    my ($self) = @_;
        $self->{valueList}->clear();
        $self->{idList}->clear();
}

# use javax::microedition::rms::RecordStore;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::persistance::PlatformRecordIdUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::configuration::persistance::PersistanceStrings;
use org::allbinary::game::configuration::persistance::NullRecordStore;

1;

