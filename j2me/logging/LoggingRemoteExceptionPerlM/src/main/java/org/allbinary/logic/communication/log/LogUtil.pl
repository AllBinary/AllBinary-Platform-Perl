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
    $self->{MESSAGE} = "message";
    $self->{isFirstException} = 1;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(200000);
    $self->{abeClientInformation} = undef;
    $self->{stringBuffer} = 'org::allbinary::logic::string::StringMaker'->new();
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
        if (!defined($log)) {
            return;
        }
        my $specialMessage = $log->getSpecialMessage();
        my $anyType = $log->getObject();
        my $functionName = $log->getFunctionName();
        my $exception = $log->getThrowable();
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
        if (defined($exception)) {
            if (ref($exception)->compareTo('org::apache::xmlrpc::XmlRpcException'->getName()) == 0) {
                return;
            }
            if (ref($exception)->compareTo('java::io::IOException'->getName()) == 0) {
                return;
            }
            if ($self->{isFirstException} || $self->{timeDelayHelper}->isTimeTNT()) {
                my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
                $self->{isFirstException} = 0;
                if (defined($anyType) && defined(ref($anyType))) {
                    $className = ("" . ref($anyType));
                }
                my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
                try {
                    print("Eeeek", "\n");
                    if (!defined($self->{abeClientInformation})) {
                        die ("RuntimeException");
                    }
                    my $hashtable = $self->{abeClientInformation}->toHashtable();
                    $self->{stringBuffer}->delete(0, $self->{stringBuffer}->length());
                    $self->{stringBuffer}->append($message);
                    $self->{stringBuffer}->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
                    $self->{stringBuffer}->append('org::allbinary::canvas::SpecialMessageUtil'->getInstance()->get());
                    $hashtable->put($self->{MESSAGE}, $self->{stringBuffer}->toString());
                    'org::allbinary::logic::communication::log::XmlRpcRemoteLogClient'->new($self->{abeClientInformation})->get($hashtable);
                } catch ($e) {
                    print("Exception", "\n");
                    print(STDERR $e, "\n");
                }
            }
        }
}

# use java::io::IOException;
use org::apache::xmlrpc::XmlRpcException;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::canvas::SpecialMessageUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;
use org::allbinary::logic::communication::log::LogFormatUtil;
use java::lang::System;
use org::allbinary::logic::communication::log::XmlRpcRemoteLogClient;

1;

