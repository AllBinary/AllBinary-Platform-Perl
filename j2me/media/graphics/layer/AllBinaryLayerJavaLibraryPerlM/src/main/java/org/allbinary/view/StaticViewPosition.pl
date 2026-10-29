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

package org::allbinary::view::StaticViewPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::view::ViewPosition';



sub new {
    my ($class, $x, $y, $z) = @_;
    my $self = $class->SUPER::new($x, $y, $z);
        # super(...) made $self above
    return $self;
}


sub getX {
    my ($self) = @_;
        return $self->getRawX();
}


sub getY {
    my ($self) = @_;
        return $self->getRawY();
}


sub getZ {
    my ($self) = @_;
        return $self->getRawZ();
}

use org::allbinary::view::ViewPosition;

1;

