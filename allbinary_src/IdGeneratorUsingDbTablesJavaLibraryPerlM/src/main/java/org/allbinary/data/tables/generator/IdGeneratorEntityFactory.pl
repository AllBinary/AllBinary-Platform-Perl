# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
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

package org::allbinary::data::tables::generator::IdGeneratorEntityFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        try {
            return 'org::allbinary::data::tables::generator::IdGeneratorEntity'->new();
        } catch ($e) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, "ServerLicenseRequestEntityFactory", $commonStrings->{GET_INSTANCE}, $e);
            return undef;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

