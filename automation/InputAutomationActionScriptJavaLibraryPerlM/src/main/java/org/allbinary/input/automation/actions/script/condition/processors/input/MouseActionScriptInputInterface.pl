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
package org::allbinary::input::automation::actions::script::condition::processors::input::MouseActionScriptInputInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputInterface';



sub setPoint {
    my ($self, $point) = @_;
    die "abstract method setPoint";
}


sub getPoint {
    my ($self) = @_;
    die "abstract method getPoint";
}


sub getButtonClicks {
    my ($self) = @_;
    die "abstract method getButtonClicks";
}


sub setButtonClicks {
    my ($self, $buttons) = @_;
    die "abstract method setButtonClicks";
}


sub log {
    my ($self) = @_;
    die "abstract method log";
}

# use java::awt;
use org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputInterface;

1;

