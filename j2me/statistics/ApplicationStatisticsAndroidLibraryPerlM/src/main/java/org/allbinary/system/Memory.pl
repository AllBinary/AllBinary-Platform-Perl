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

#ActualPlatform
package org::allbinary::system::Memory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInfo {
    my ($class) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $maxUtilizedMemoryAvailable = 'java::lang::Runtime'->getRuntime()->maxMemory();
        my $memoryUsed = 'java::lang::Runtime'->getRuntime()->totalMemory();
        $stringBuffer->append("APK Memory: Available: ");
        $stringBuffer->appendlong($maxUtilizedMemoryAvailable);
        $stringBuffer->append("/");
        $stringBuffer->appendlong(int('java::lang::Runtime'->getRuntime()->maxMemory()));
        $stringBuffer->append(" Used: ");
        $stringBuffer->appendlong($memoryUsed);
        $stringBuffer->append(" Free: ");
        $stringBuffer->appendlong($maxUtilizedMemoryAvailable - $memoryUsed);
        $stringBuffer->append("/");
        $stringBuffer->appendlong(int('java::lang::Runtime'->getRuntime()->maxMemory() - $memoryUsed));
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use java::lang::Runtime;

1;

