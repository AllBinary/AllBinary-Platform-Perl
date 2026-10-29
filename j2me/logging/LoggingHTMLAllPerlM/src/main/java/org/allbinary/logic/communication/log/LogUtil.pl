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
    $self->{LOG_SUCCESS} = "org.allbinary: ";
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
        my $className = 'org::allbinary::logic::communication::log::PreLogUtil'->getClassName($anyType);
        if (!defined($className)) {
            $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        }
        my $message = $self->{logFormatUtil}->getS($className, $functionName, $specialMessage);
        'playn::core::PlayN'->log()->debug($self->{LOG_SUCCESS} . $message);
}


sub putFS {
    my ($self, $specialMessage, $className, $functionName) = @_;
        my $message = $self->{logFormatUtil}->getS($className, $functionName, $specialMessage);
        'playn::core::PlayN'->log()->debug($self->{LOG_SUCCESS} . $message);
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        my $className = 'org::allbinary::logic::communication::log::PreLogUtil'->getClassName($anyType);
        if (!defined($className)) {
            $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        }
        my $message = $self->{logFormatUtil}->get($className, $functionName, $specialMessage, $exception);
        if (defined($exception)) {
            'playn::core::PlayN'->log()->error($self->{LOG_SUCCESS} . $message, $exception);
        } else {
            'playn::core::PlayN'->log()->debug($self->{LOG_SUCCESS} . $message);
        }
}

use org::allbinary::string::CommonStrings;
use playn::core::PlayN;
use org::allbinary::logic::communication::log::LogFormatUtil;
use org::allbinary::logic::communication::log::PreLogUtil;

1;

