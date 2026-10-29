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
package org::allbinary::logic::communication::log::LogFormatUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::LogFormatUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{timeStampUtil} = 'org::allbinary::time::TimeStampUtil'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{LOG_ERROR} = "\nLog-Error: ";
    $self->{EMPTY} = "Empty";
    $self->{STACK_TRACE} = "\nStack Trace: ";
    $self->{TIME} = "Time: ";
    $self->{CLASS_NAME} = $self->{commonSeps}->{SPACE};
    $self->{FUNCTION_CALL} = 'org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP};
    $self->{SPECIAL_MESSAGE} = "> ";
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{exceptionUtil} = 'org::allbinary::logic::java::exception::ExceptionUtil'->getInstance();
    $self->{nullUtil} = 'org::allbinary::logic::NullUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::LogFormatUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub get {
    my ($self, $className, $functionName, $specialMessage, $exception) = @_;
        my $stringBuffer = $self->getF($className, $functionName);
        $stringBuffer->append($self->getO($exception));
        $stringBuffer->append($self->{SPECIAL_MESSAGE});
        $stringBuffer->append($specialMessage);
        $stringBuffer->append($self->{commonSeps}->{NEW_LINE});
        return $stringBuffer->toString();
}


sub getS {
    my ($self, $className, $functionName, $specialMessage) = @_;
        my $stringBuffer = $self->getF($className, $functionName);
        $stringBuffer->append($self->{SPECIAL_MESSAGE});
        $stringBuffer->append($specialMessage);
        $stringBuffer->append($self->{commonSeps}->{NEW_LINE});
        return $stringBuffer->toString();
}


sub getF {
    my ($self, $className, $functionName) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{TIME});
        $stringBuffer->append($self->{timeStampUtil}->getAsString());
        $stringBuffer->append($self->{CLASS_NAME});
        $stringBuffer->append($className);
        $stringBuffer->append($self->{FUNCTION_CALL});
        $stringBuffer->append($functionName);
        return $stringBuffer;
}


sub getO {
    my ($self, $exception) = @_;
        if ($exception != $self->{nullUtil}->{NULL_OBJECT}) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{LOG_ERROR});
            my $exceptionAsString = $exception->toString();
            if (defined($exceptionAsString)) {
                $stringBuffer->append($exceptionAsString);
            } else {
                $stringBuffer->append($self->{EMPTY});
            }
            $stringBuffer->append($self->{STACK_TRACE});
            if ($exception != $self->{nullUtil}->{NULL_OBJECT}) {
                $stringBuffer->append($self->{exceptionUtil}->getStackTrace($exception));
            } else {
                $stringBuffer->append($self->{stringUtil}->{NULL_STRING});
            }
            return $stringBuffer->toString();
        } else {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}

use org::allbinary::logic::NullUtil;
use org::allbinary::time::TimeStampUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::java::exception::ExceptionUtil;
use org::allbinary::string::CommonLabels;

1;

