# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::view::NullEmulatorView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::view::EmulatorViewInterface';

our $NULL_EMULATOR_VIEW = 'org::allbinary::view::NullEmulatorView'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub setMidlet {
    my ($self, $midlet) = @_;
}


sub onEmulatorInitComplete {
    my ($self, $midletActivity) = @_;
}


sub onSetDisplayable {
    my ($self, $displayable) = @_;
}

# use javax::microedition::lcdui::Displayable;
# use javax::microedition::midlet::MIDlet;
use org::allbinary::view::EmulatorViewInterface;

1;

