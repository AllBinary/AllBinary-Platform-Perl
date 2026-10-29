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

package org::allbinary::view::CenterStaticViewPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $z) = @_;
        my $displayInfoSingleton = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        return 'org::allbinary::view::StaticViewPosition'->new((POSIX::floor(($displayInfoSingleton->getLastWidth()) / (2 ** (1)))), (POSIX::floor(($displayInfoSingleton->getLastHeight()) / (2 ** (1)))), $z);
}

use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::view::StaticViewPosition;

1;

