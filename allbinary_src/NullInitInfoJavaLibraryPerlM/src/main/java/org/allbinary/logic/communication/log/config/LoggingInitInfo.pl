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

package org::allbinary::logic::communication::log::config::LoggingInitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $logConfigInfoList = undef;
our $hasRead = 0;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub write {
    my ($class) = @_;
        try {
            $org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead = 0;
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub read {
    my ($class) = @_;
        try {
        } catch ($e) {
            die $e;
        }
}


sub setHasRead {
    my ($class, $value) = @_;
        $org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead = $value;
}


# throws Exception
sub updateIfNeeded {
    my ($class) = @_;
        if (!$org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead) {
            'org::allbinary::logic::communication::log::config::LoggingInitInfo'->read();
            $org::allbinary::logic::communication::log::config::LoggingInitInfo::hasRead = 1;
            if (!defined($org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList)) {
                die ("Read Failed");
            }
        }
}


sub isValid {
    my ($self) = @_;
        try {
            return 1;
        } catch ($e) {
            return 0;
        }
}


sub set {
    my ($class, $logConfigInfoList) = @_;
        $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList = $logConfigInfoList;
}


# throws Exception
sub get {
    my ($class) = @_;
        'org::allbinary::logic::communication::log::config::LoggingInitInfo'->updateIfNeeded();
        return $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList;
}


# throws Exception
sub getTypeList {
    my ($class) = @_;
        'org::allbinary::logic::communication::log::config::LoggingInitInfo'->updateIfNeeded();
        my $allLogTypeVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->size();
        for (my $index = 0; $index < $size; $index++) {
            my $logConfigInfo = $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->{objectArray}->[$index];
            my $logTypeVector = $logConfigInfo->getTypeVector();
            if ($logConfigInfo->isEnabled()) {
                $allLogTypeVector->addAllList($logTypeVector);
            }
        }
        return $allLogTypeVector;
}


# throws Exception
sub getNumberOfLogConfigs {
    my ($self) = @_;
        return $org::allbinary::logic::communication::log::config::LoggingInitInfo::logConfigInfoList->size();
}


sub toString {
    my ($self) = @_;
        try {
            return undef;
        } catch ($e) {
            return "Error";
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

