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

package org::allbinary::logic::system::security::licensing::InputAutomationClientInformation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::AbeClientInformation';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new("InputAutomationTool", "0.0.1", "InputAutomationTool 0.0.1", "IA");
        # super(...) made $self above
    return $self;
}

use org::allbinary::logic::system::security::licensing::AbeClientInformation;

1;

