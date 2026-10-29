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

package org::allbinary::graphics::color::ColorChangeEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
}


sub new {
    my ($class, $anyType) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::graphics::color::BasicColorFactory;

1;

