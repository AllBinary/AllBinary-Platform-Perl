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
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{logFormatUtil} = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance();
    $self->{LABEL} = "org.allbinary";
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
        $self->put($specialMessage, $anyType, $functionName, 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


sub putFS {
    my ($self, $specialMessage, $string, $functionName) = @_;
        $self->putS($specialMessage, $string, $functionName, 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        my $className = $self->{LABEL};
        $className = ("" . 'org::allbinary::logic::string::StringMaker'->new()->append(ref($anyType))->append($self->{commonSeps}->{COLON})->append(sprintf("%x", 'org::allbinary::TsUtil'->getInstance()->hashCode($anyType)))->toString());
        my $message = $self->{logFormatUtil}->get($className, $functionName, $specialMessage, $exception);
        $org::allbinary::logic::communication::log::android::util->{Log}->i($self->{LABEL}, $message);
}


sub putS {
    my ($self, $specialMessage, $string, $functionName, $exception) = @_;
        my $className = $self->{LABEL};
        $className = ("" . 'org::allbinary::logic::string::StringMaker'->new()->append($string)->append($self->{commonSeps}->{COLON})->append(sprintf("%x", 'org::allbinary::TsUtil'->getInstance()->hashCode($string)))->toString());
        my $message = $self->{logFormatUtil}->get($className, $functionName, $specialMessage, $exception);
        $org::allbinary::logic::communication::log::android::util->{Log}->i($self->{LABEL}, $message);
}

use org::allbinary::logic::NullUtil;
use org::allbinary::TsUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::communication::log::LogFormatUtil;

1;

