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

our $LABEL = "org.allbinary";


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
        my $className = $org::allbinary::logic::communication::log::PreLogUtil::LABEL;
        my $actualClassName = ref($anyType);
        if (defined($actualClassName)) {
            $className = $actualClassName;
        }
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
        $org::allbinary::logic::communication::log::android::util->{Log}->i($org::allbinary::logic::communication::log::PreLogUtil::LABEL, $message);
}


sub putS {
    my ($class, $specialMessage, $className, $functionName) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->putSE($specialMessage, $className, $functionName, 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}


sub putSE {
    my ($class, $specialMessage, $className, $functionName, $exception) = @_;
        my $message = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance()->get($className, $functionName, $specialMessage, $exception);
        $org::allbinary::logic::communication::log::android::util->{Log}->i($className, $message);
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogFormatUtil;

1;

