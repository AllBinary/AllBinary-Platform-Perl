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

package org::allbinary::graphics::displayable::screen::ScreenRepaintProcessorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::screen::ScreenRepaintProcessorFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::screen::ScreenRepaintProcessorFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub create {
    my ($self, $displayable) = @_;
        if (!'org::allbinary::J2MEUtil'->isJ2ME()) {
            return 'org::allbinary::graphics::displayable::screen::ScreenRepaintProcessor'->new($displayable);
        } else {
            return 'org::allbinary::canvas::Processor'->getInstance();
        }
}

# use javax::microedition::lcdui::Displayable;
use org::allbinary::J2MEUtil;
use org::allbinary::canvas::Processor;
use org::allbinary::graphics::displayable::screen::ScreenRepaintProcessor;

1;

