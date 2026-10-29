# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

package org::allbinary::logic::PropertyInitUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::PropertyInitUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class, $value) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        $logUtil->putF('org::allbinary::logic::string::StringMaker'->new()->append("PropertyInitUtil: ")->appendint($value)->toString(), $logUtil, $commonStrings->{CONSTRUCTOR});
        return $org::allbinary::logic::PropertyInitUtil::instance;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;

1;

