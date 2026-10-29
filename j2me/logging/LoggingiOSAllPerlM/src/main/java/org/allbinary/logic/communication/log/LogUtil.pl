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
our $LOG_SUCCESS = "org.allbinary: ";

sub _init_fields {
    my ($self) = @_;
    $self->{logFormatUtil} = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::LogUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
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
        my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        if (defined(ref($anyType))) {
            $className = ("" . 'org::allbinary::logic::string::StringMaker'->new()->append(ref($anyType))->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON})->append(sprintf("%x", 'org::allbinary::logic::TsUtil'->getInstance()->hashCode($anyType)))->toString());
        }
        my $message = $self->{logFormatUtil}->getS($className, $functionName, $specialMessage);
        print($org::allbinary::logic::communication::log::LogUtil::LOG_SUCCESS);
        print($message, "\n");
}


sub putFS {
    my ($self, $specialMessage, $className, $functionName) = @_;
        $className = ("" . 'org::allbinary::logic::string::StringMaker'->new()->append($className)->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON})->append(sprintf("%x", 'org::allbinary::logic::TsUtil'->getInstance()->hashCode($self->{anyType})))->toString());
        my $message = $self->{logFormatUtil}->getS($className, $functionName, $specialMessage);
        print($org::allbinary::logic::communication::log::LogUtil::LOG_SUCCESS);
        print($message, "\n");
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        if (defined(ref($anyType))) {
            $className = ("" . 'org::allbinary::logic::string::StringMaker'->new()->append(ref($anyType))->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON})->append(sprintf("%x", 'org::allbinary::logic::TsUtil'->getInstance()->hashCode($anyType)))->toString());
        }
        my $message = $self->{logFormatUtil}->get($className, $functionName, $specialMessage, $exception);
        print($org::allbinary::logic::communication::log::LogUtil::LOG_SUCCESS);
        print($message, "\n");
}

use org::allbinary::logic::TsUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogFormatUtil;
use java::lang::System;

1;

