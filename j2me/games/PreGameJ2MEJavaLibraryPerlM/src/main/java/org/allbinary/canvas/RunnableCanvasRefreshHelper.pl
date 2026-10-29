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

package org::allbinary::canvas::RunnableCanvasRefreshHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub _init_fields {
    my ($self) = @_;
    $self->{runnableCanvas} = undef;
}


sub new {
    my ($class, $runnableCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{runnableCanvas} = $runnableCanvas;
    return $self;
}


sub process {
    my ($self) = @_;
        $self->{runnableCanvas}->repaint();
}

use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::canvas::Processor;

1;

