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

package org::allbinary::logic::communication::java::vm::stats::JvmStatisticsMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::java::vm::stats::JvmStatistics','org::allbinary::data::tables::TableMappingInterface';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        # super(...) made $self above
    return $self;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::FREE_MEMORY_BYTES, $self->getFreeMemoryBytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::FREE_MEMORY_KILOBYTES, $self->getFreeMemoryKilobytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::FREE_MEMORY_MEGABYTES, $self->getFreeMemoryMegabytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::MAX_MEMORY_BYTES, $self->getMaxMemoryBytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::MAX_MEMORY_KILOBYTES, $self->getMaxMemoryKilobytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::MAX_MEMORY_MEGABYTES, $self->getMaxMemoryMegabytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::NUMBER_OF_THREADS, $self->getNumberOfThreadsString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::TOTAL_MEMORY_BYTES, $self->getTotalMemoryBytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::TOTAL_MEMORY_KILOBYTES, $self->getTotalMemoryKilobytesString());
        $hashMap->put($org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::TOTAL_MEMORY_MEGABYTES, $self->getTotalMemoryMegabytesString());
        return $hashMap;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::NAME;
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($self->getFreeMemoryBytesString());
        $vector->add($self->getFreeMemoryKilobytesString());
        $vector->add($self->getFreeMemoryMegabytesString());
        $vector->add($self->getMaxMemoryBytesString());
        $vector->add($self->getMaxMemoryKilobytesString());
        $vector->add($self->getMaxMemoryMegabytesString());
        $vector->add($self->getNumberOfThreadsString());
        $vector->add($self->getTotalMemoryBytesString());
        $vector->add($self->getTotalMemoryKilobytesString());
        $vector->add($self->getTotalMemoryMegabytesString());
        return $vector;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::java::vm::stats::JvmStatistics;
use org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData;

1;

