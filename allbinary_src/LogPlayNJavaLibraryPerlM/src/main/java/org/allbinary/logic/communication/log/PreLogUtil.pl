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
        my $className = 'org::allbinary::logic::communication::log::PreLogUtil'->getClassName($anyType);
        if (!defined($className)) {
            $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        }
        $className = 'org::allbinary::logic::string::StringMaker'->new()->append($className)->append('org::allbinary::string::CommonSeps'->getInstance()->{FORWARD_SLASH})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($anyType))->toString();
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->getS($className, $functionName, $specialMessage);
        'playn::core::PlayN'->log()->debug($org::allbinary::logic::communication::log::PreLogUtil::LOG_SUCCESS . $message);
}


sub putOE {
    my ($class, $specialMessage, $anyType, $functionName, $exception) = @_;
        my $className = 'org::allbinary::logic::communication::log::PreLogUtil'->getClassName($anyType);
        if (!defined($className)) {
            $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        }
        $className = 'org::allbinary::logic::string::StringMaker'->new()->append($className)->append('org::allbinary::string::CommonSeps'->getInstance()->{FORWARD_SLASH})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($anyType))->toString();
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
        'playn::core::PlayN'->log()->error($org::allbinary::logic::communication::log::PreLogUtil::LOG_SUCCESS . $message, $exception);
}


sub putS {
    my ($class, $specialMessage, $className, $functionName) = @_;
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->getS($className, $functionName, $specialMessage);
        'playn::core::PlayN'->log()->debug($org::allbinary::logic::communication::log::PreLogUtil::LOG_SUCCESS . $message);
}


sub putSE {
    my ($class, $specialMessage, $className, $functionName, $exception) = @_;
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
        'playn::core::PlayN'->log()->error($org::allbinary::logic::communication::log::PreLogUtil::LOG_SUCCESS . $message, $exception);
}


sub getClassName {
    my ($class, $anyType) = @_;
    die "abstract method getClassName";
}

use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use playn::core::PlayN;
use org::allbinary::logic::communication::log::LogFormatUtil;

1;

