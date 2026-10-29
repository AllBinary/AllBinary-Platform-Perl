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

# Java interface
package org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub isMountable {
    my ($self) = @_;
    die "abstract method isMountable";
}


sub isFrameable {
    my ($self) = @_;
    die "abstract method isFrameable";
}


sub isQuickFrameable {
    my ($self) = @_;
    die "abstract method isQuickFrameable";
}


sub setMountable {
    my ($self, $canBeMounted) = @_;
    die "abstract method setMountable";
}


sub setFrameable {
    my ($self, $canBeFramed) = @_;
    die "abstract method setFrameable";
}


sub setQuickFrameable {
    my ($self, $canBeQuickFramed) = @_;
    die "abstract method setQuickFrameable";
}


sub setMountedLink {
    my ($self, $mountedLink) = @_;
    die "abstract method setMountedLink";
}


sub getMountedLink {
    my ($self) = @_;
    die "abstract method getMountedLink";
}


1;

