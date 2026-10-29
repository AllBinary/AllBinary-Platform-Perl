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

package org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::EventObject';



sub new {
    my ($class, $source) = @_;
    my $self = $class->SUPER::new($source);
        # super(...) made $self above
    return $self;
}


sub getSource {
    my ($self) = @_;
        return $self->SUPER::getSource();
}


sub toString {
    my ($self) = @_;
        return $self->SUPER::toString();
}


sub getCommand {
    my ($self) = @_;
        my $myEventSource = $self->getSource();
        return $myEventSource->getCommand();
}


sub getTreeNode {
    my ($self) = @_;
        my $myEventSource = $self->getSource();
        return $myEventSource->getTreeNode();
}


sub getAngle {
    my ($self) = @_;
        my $myEventSource = $self->getSource();
        return $myEventSource->getAngle();
}

# use javax::swing::tree::MutableTreeNode;

1;

