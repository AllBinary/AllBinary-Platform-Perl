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
package org::allbinary::game::input::InputPersistance;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::configuration::persistance::BasicPersitance';


sub _init_fields {
    my ($self) = @_;
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
        my $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
        my $recordEnum = $recordStore->enumerateRecords($org::allbinary::game::configuration::persistance::NullRecordFilter::NULL_RECORD_FILTER, $org::allbinary::game::configuration::persistance::NullRecordComparator::NULL_RECORD_COMPARATOR, 1);
        my $hashtable = undef;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $id = 0;
        while ($recordEnum->hasNextElement()) {
            $id = $recordEnum->nextRecordId();
            $stringBuffer->delete(0, $stringBuffer->length());
            $self->{logUtil}->putF($stringBuffer->append($self->{persistanceStrings}->{LOADING_ID})->appendint($id)->toString(), $self, $self->{persistanceStrings}->{LOAD_ALL});
            $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
            $self->{valueList}->add($hashtable);
            $self->{idList}->add($smallIntegerSingletonFactory->getAt($id));
        }
        $recordStore->closeRecordStore();
}


# throws Exception
sub save {
    my ($self, $abeClientInformation, $hashtable) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{persistanceStrings}->{NOT_SAVING})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($hashtable))->toString(), $self, $self->{commonStrings}->{SAVE});
        my $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($abeClientInformation), 1);
        my $gameActionInput = undef;
        my $list = undef;
        my $input = undef;
        my $inputObjectArray = $self->{hashtableUtil}->getKeysAsArray($hashtable);
        my $size = scalar(@{$inputObjectArray});
        for (my $index = 0; $index < $size; $index++) {
            $gameActionInput = $inputObjectArray->[$index];
            $list = $hashtable->get($inputObjectArray->[$index]);
            for (my $index2 = 0; $index2 < $list->size(); $index2++) {
                $input = $list->get($index2);
            }
        }
        $recordStore->closeRecordStore();
}

# use javax::microedition::rms::RecordEnumeration;
# use javax::microedition::rms::RecordStore;
use org::allbinary::game::configuration::persistance::BasicPersitance;
use org::allbinary::game::configuration::persistance::NullRecordComparator;
use org::allbinary::game::configuration::persistance::NullRecordFilter;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::HashtableUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;

1;

