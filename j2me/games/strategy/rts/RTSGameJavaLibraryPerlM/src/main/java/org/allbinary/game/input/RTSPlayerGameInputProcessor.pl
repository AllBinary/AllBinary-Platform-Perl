# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::input::RTSPlayerGameInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::GameInputProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{rtsPlayerGameInput} = undef;
}


sub new {
    my ($class, $rtsPlayerGameInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{rtsPlayerGameInput} = $rtsPlayerGameInput;
    return $self;
}

use org::allbinary::game::input::GameInputProcessor;

1;

