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
package org::allbinary::logic::communication::log::LogUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::LogUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::LogUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub putL {
    my ($self, $log) = @_;
        my $specialMessage = $log->getSpecialMessage();
        my $anyType = $log->getObject();
        my $functionName = $log->getFunctionName();
        my $exception = $log->getThrowable();
        $self->put($specialMessage, $anyType, $functionName, $exception);
}


sub putF {
    my ($self, $specialMessage, $anyType, $functionName) = @_;
        'org::allbinary::log::FileLog'->put($specialMessage, $anyType, $functionName);
}


sub putFS {
    my ($self, $specialMessage, $className, $functionName) = @_;
        'org::allbinary::log::FileLog'->put($specialMessage, $className, $functionName);
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        'org::allbinary::log::FileLog'->put($specialMessage, $anyType, $functionName, $exception);
}

use org::allbinary::log::FileLog;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;

1;

