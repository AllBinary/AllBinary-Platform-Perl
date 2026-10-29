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

package org::allbinary::midlet::MidletExitProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub _init_fields {
    my ($self) = @_;
    $self->{midlet} = undef;
}


sub new {
    my ($class, $midlet) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{midlet} = $midlet;
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->{midlet}->exit();
}

# use javax::microedition::midlet::MIDlet;
use org::allbinary::canvas::Processor;

1;

