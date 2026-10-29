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
package org::allbinary::logic::communication::log::LogFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstanceNoF {
    my ($class, $specialMessage, $anyType, $exception) = @_;
        return 'org::allbinary::logic::communication::log::Log'->new($specialMessage, $anyType, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $exception);
}


sub getInstance {
    my ($class, $specialMessage, $anyType, $functionName, $exception) = @_;
        return 'org::allbinary::logic::communication::log::Log'->new($specialMessage, $anyType, $functionName, $exception);
}


sub getInstanceF {
    my ($class, $specialMessage, $anyType, $functionName) = @_;
        return 'org::allbinary::logic::communication::log::Log'->new($specialMessage, $anyType, $functionName, 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT});
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::log::Log;

1;

