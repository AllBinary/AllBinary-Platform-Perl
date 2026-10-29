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

package org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraints;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{frameable} = 0;
    $self->{mountable} = 0;
    $self->{quickFrameable} = 0;
    $self->{mountedLink} = undef;
}


sub new {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isMountable {
    my ($self) = @_;
        return $self->{mountable};
}


sub setMountable {
    my ($self, $mountable) = @_;
        $self->{mountable} = $mountable;
}


sub isFrameable {
    my ($self) = @_;
        return $self->{frameable};
}


sub setFrameable {
    my ($self, $frameable) = @_;
        $self->{frameable} = $frameable;
}


sub isQuickFrameable {
    my ($self) = @_;
        return $self->{quickFrameable};
}


sub setQuickFrameable {
    my ($self, $quickFrameable) = @_;
        $self->{quickFrameable} = $quickFrameable;
}


sub getMountedLink {
    my ($self) = @_;
        return $self->{mountedLink};
}


sub setMountedLink {
    my ($self, $mountedLink) = @_;
        $self->{mountedLink} = $mountedLink;
}

use org::w3c::dom::Node;
use org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface;

1;

