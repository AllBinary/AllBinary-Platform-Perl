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

package org::allbinary::graphics::j2me::workarea::tools::event::MyGraphicItemEventSource;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{command} = undef;
    $self->{treeNode} = undef;
    $self->{angle} = 0.0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of MyGraphicItemEventSource takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $command, $treeNode) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{command} = $command;
        $self->{treeNode} = $treeNode;
    return $self;
}


sub _new3 {
    my ($class, $command, $angle, $treeNode) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{command} = $command;
        $self->{treeNode} = $treeNode;
        $self->setAngle($angle);
    return $self;
}


sub getCommand {
    my ($self) = @_;
        return $self->{command};
}


sub getTreeNode {
    my ($self) = @_;
        return $self->{treeNode};
}


sub getAngle {
    my ($self) = @_;
        return $self->{angle};
}


sub setAngle {
    my ($self, $angle) = @_;
        $self->{angle} = $angle;
}

# use javax::swing::tree::MutableTreeNode;

1;

