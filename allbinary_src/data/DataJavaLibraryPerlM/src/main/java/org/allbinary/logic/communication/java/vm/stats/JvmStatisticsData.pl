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
use parent -norequire,'java::lang::Object';

our $JVM_STATISTICS = "JVM_STATISTICS_";
tie our $NAME, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "NAME" };
tie our $TOTAL_MEMORY_BYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "TOTAL_MEMORY_BYTES" };
tie our $TOTAL_MEMORY_KILOBYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "TOTAL_MEMORY_KILOBYTES" };
tie our $TOTAL_MEMORY_MEGABYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "TOTAL_MEMORY_MEGABYTES" };
tie our $FREE_MEMORY_BYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "FREE_MEMORY_BYTES" };
tie our $FREE_MEMORY_KILOBYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "FREE_MEMORY_KILOBYTES" };
tie our $FREE_MEMORY_MEGABYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "FREE_MEMORY_MEGABYTES" };
tie our $MAX_MEMORY_BYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "MAX_MEMORY_BYTES" };
tie our $MAX_MEMORY_KILOBYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "MAX_MEMORY_KILOBYTES" };
tie our $MAX_MEMORY_MEGABYTES, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "MAX_MEMORY_MEGABYTES" };
tie our $NUMBER_OF_THREADS, 'java::lang::LazyStatic', sub { $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::JVM_STATISTICS . "NUMBER_OF_THREADS" };


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
        # super(...) made $self above
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

