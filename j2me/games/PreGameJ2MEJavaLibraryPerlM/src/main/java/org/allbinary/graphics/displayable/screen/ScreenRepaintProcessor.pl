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

package org::allbinary::graphics::displayable::screen::ScreenRepaintProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub _init_fields {
    my ($self) = @_;
    $self->{displayable} = undef;
}


sub new {
    my ($class, $displayable) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{displayable} = $displayable;
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        'org::allbinary::graphics::displayable::screen::ScreenRepaintUtil'->repaint($self->{displayable});
}

# use javax::microedition::lcdui::Displayable;
use org::allbinary::canvas::Processor;
use org::allbinary::graphics::displayable::screen::ScreenRepaintUtil;

1;

