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

package org::allbinary::logic::communication::log::ForcedLogUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub log {
    my ($class, $message, $anyType) = @_;
        try {
            die ($message);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE('org::allbinary::string::CommonStrings'->getInstance()->{EXCEPTION}, $anyType, "log", $e);
        }
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::PreLogUtil;

1;

