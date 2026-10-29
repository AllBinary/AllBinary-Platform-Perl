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
package org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputInterface';



sub getDelayBetweenKeys {
    my ($self) = @_;
    die "abstract method getDelayBetweenKeys";
}


sub getKeyArray {
    my ($self) = @_;
    die "abstract method getKeyArray";
}


sub isPress {
    my ($self) = @_;
    die "abstract method isPress";
}


sub isRelease {
    my ($self) = @_;
    die "abstract method isRelease";
}


sub isNormal {
    my ($self) = @_;
    die "abstract method isNormal";
}


sub setPress {
    my ($self, $press) = @_;
    die "abstract method setPress";
}


sub setRelease {
    my ($self, $release) = @_;
    die "abstract method setRelease";
}


sub setNormal {
    my ($self) = @_;
    die "abstract method setNormal";
}


sub getText {
    my ($self) = @_;
    die "abstract method getText";
}


sub setText {
    my ($self, $text) = @_;
    die "abstract method setText";
}


sub log {
    my ($self) = @_;
    die "abstract method log";
}

use org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputInterface;

1;

