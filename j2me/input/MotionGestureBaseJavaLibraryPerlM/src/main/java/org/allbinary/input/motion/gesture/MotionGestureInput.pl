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

package org::allbinary::input::motion::gesture::MotionGestureInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::Input';



sub new {
    my ($class, $id, $name) = @_;
    my $self = $class->SUPER::new($id, $name);
        # super(...) made $self above
        my $inputFactory = 'org::allbinary::game::input::InputFactory'->getInstance();
        $inputFactory->add($self->getId(), $self);
    return $self;
}

use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;

1;

