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
package org::allbinary::logic::communication::log::PreLogUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $LOG_SUCCESS = "org.allbinary: ";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub put {
    my ($class, $specialMessage, $anyType, $functionName) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->putOE($specialMessage, $anyType, $functionName, 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


sub putOE {
    my ($class, $specialMessage, $anyType, $functionName, $exception) = @_;
        my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        if (defined(ref($anyType))) {
            $className = ("" . ref($anyType));
        }
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
        print($LOG_SUCCESS);
        print($message, "\n");
}


sub putSE {
    my ($class, $specialMessage, $className, $functionName, $exception) = @_;
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
        print($LOG_SUCCESS);
        print($message, "\n");
}

use org::allbinary::logic::NullUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogFormatUtil;
use java::lang::System;

1;

