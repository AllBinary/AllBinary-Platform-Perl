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

sub _init_fields {
    my ($self) = @_;
    $self->{logFormatUtil} = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance();
    $self->{LOG_SUCCESS} = "org.allbinary: ";
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
        if ($log == $org::allbinary::logic::communication::log::LogFactory::LOG) {
            return;
        }
        my $exception = $log->getThrowable();
        if (!defined($exception)) {
            return;
        }
        my $specialMessage = $log->getSpecialMessage();
        my $anyType = $log->getObject();
        my $functionName = $log->getFunctionName();
        $self->put($specialMessage, $anyType, $functionName, $exception);
}


sub putF {
    my ($self, $specialMessage, $anyType, $functionName) = @_;
}


# Java overloaded method: Perl keeps the last definition
sub putF {
    my ($self, $specialMessage, $className, $functionName) = @_;
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        if (defined(ref($anyType))) {
            $className = ("" . ref($anyType));
        }
        my $message = $self->{logFormatUtil}->get($className, $functionName, $specialMessage, $exception);
        print($self->{LOG_SUCCESS});
        print($message, "\n");
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogFormatUtil;
use org::allbinary::logic::communication::log::LogFactory;
use java::lang::System;

1;

