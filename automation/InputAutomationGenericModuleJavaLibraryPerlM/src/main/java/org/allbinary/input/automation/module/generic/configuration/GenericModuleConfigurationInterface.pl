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

# Java interface
package org::allbinary::input::automation::module::generic::configuration::GenericModuleConfigurationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getSelectedGenericProfile {
    my ($self) = @_;
    die "abstract method getSelectedGenericProfile";
}


sub setSelectedGenericProfile {
    my ($self, $selectedGenericProfile) = @_;
    die "abstract method setSelectedGenericProfile";
}

use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile;

1;

