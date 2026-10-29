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
package org::allbinary::game::input::TestInputInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::PaintableInterface';



sub up {
    my ($self) = @_;
    die "abstract method up";
}


sub down {
    my ($self) = @_;
    die "abstract method down";
}


sub left {
    my ($self) = @_;
    die "abstract method left";
}


sub right {
    my ($self) = @_;
    die "abstract method right";
}


sub strafeLeft {
    my ($self) = @_;
    die "abstract method strafeLeft";
}


sub strafeRight {
    my ($self) = @_;
    die "abstract method strafeRight";
}

use org::allbinary::graphics::paint::PaintableInterface;

1;

