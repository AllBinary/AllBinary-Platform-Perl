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

package org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $JVM_STATISTICS = "JVM_STATISTICS_";
our $NAME = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "NAME";
our $TOTAL_MEMORY_BYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "TOTAL_MEMORY_BYTES";
our $TOTAL_MEMORY_KILOBYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "TOTAL_MEMORY_KILOBYTES";
our $TOTAL_MEMORY_MEGABYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "TOTAL_MEMORY_MEGABYTES";
our $FREE_MEMORY_BYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "FREE_MEMORY_BYTES";
our $FREE_MEMORY_KILOBYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "FREE_MEMORY_KILOBYTES";
our $FREE_MEMORY_MEGABYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "FREE_MEMORY_MEGABYTES";
our $MAX_MEMORY_BYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "MAX_MEMORY_BYTES";
our $MAX_MEMORY_KILOBYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "MAX_MEMORY_KILOBYTES";
our $MAX_MEMORY_MEGABYTES = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "MAX_MEMORY_MEGABYTES";
our $NUMBER_OF_THREADS = $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "NUMBER_OF_THREADS";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
        # super(...) made $self above
    return $self;
}


1;

