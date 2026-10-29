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

package org::allbinary::game::input::DesktopGameInputMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PCGameInputMapping';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getDefault {
    my ($self) = @_;
        return 'org::allbinary::game::input::DesktopDefaultGameInputMapping'->new()->getInputMapping();
}

use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::game::input::PCGameInputMapping;
use org::allbinary::game::input::DesktopDefaultGameInputMapping;

1;

