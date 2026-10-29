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

package org::allbinary::bounds::event::BoundsChangeEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';



sub new {
    my ($class, $rectangle) = @_;
    my $self = $class->SUPER::new($rectangle);
        # super(...) made $self above
    return $self;
}


sub getRectangle {
    my ($self) = @_;
        return $self->getSource();
}

use org::allbinary::graphics::Rectangle;
use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

