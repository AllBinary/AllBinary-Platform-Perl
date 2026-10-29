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
    $self->{logger} = 'java::util::logging::Logger'->getLogger('org::allbinary::logic::communication::log::LogUtil'->getName());
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


sub init {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Loggin Initialized", $self, "init()");
}


sub putL {
    my ($self, $log) = @_;
        my $exception = $log->getThrowable();
        try {
            if (defined($exception)) {
                my $specialMessage = $log->getSpecialMessage();
                my $anyType = $log->getObject();
                my $functionName = $log->getFunctionName();
                my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
                my $clazz = ref($anyType);
                if (defined($clazz->getName())) {
                    $className = $clazz->getName();
                }
                my $message = $self->{logFormatUtil}->get($className, $functionName, $specialMessage, $exception);
                $self->{logger}->log($java::util::logging::Level::INFO, $message);
            }
        } catch ($e) {
        }
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        try {
            my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
            my $clazz = ref($anyType);
            if (defined($clazz->getName())) {
                $className = $clazz->getName();
            }
            my $message = $self->{logFormatUtil}->getS($className, $functionName, $specialMessage);
            if (defined($exception)) {
                $self->{logger}->log($java::util::logging::Level::SEVERE, $message, $exception);
            } else {
                $self->{logger}->log($java::util::logging::Level::INFO, $message);
            }
        } catch ($e) {
        }
}

# use java::util::logging::Level;
use org::allbinary::logic::string::StringMaker;
# use java::util::logging::Logger;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogFormatUtil;
use org::allbinary::logic::communication::log::PreLogUtil;

1;

