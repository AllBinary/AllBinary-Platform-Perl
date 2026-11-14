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

package org::allbinary::game::input::InputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{gameInputStrings} = 'org::allbinary::game::input::GameInputStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub keyPressedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
}


sub keyReleasedByDevice {
    my ($self, $canvas, $keyCode, $deviceId) = @_;
}

use java::lang::Object ();
use javax::microedition::lcdui::Canvas ();
use org::allbinary::game::input::GameInputStrings ();

1;

