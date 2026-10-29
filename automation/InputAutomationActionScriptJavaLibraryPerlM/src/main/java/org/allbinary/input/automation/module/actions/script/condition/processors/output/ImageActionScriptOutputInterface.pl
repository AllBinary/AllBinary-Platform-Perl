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
package org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputInterface';



sub getImageTypes {
    my ($self) = @_;
    die "abstract method getImageTypes";
}


sub setImageTypes {
    my ($self, $imageTypes) = @_;
    die "abstract method setImageTypes";
}


sub isSaved {
    my ($self) = @_;
    die "abstract method isSaved";
}


sub setSaved {
    my ($self, $saved) = @_;
    die "abstract method setSaved";
}


sub isDisplay {
    my ($self) = @_;
    die "abstract method isDisplay";
}


sub setDisplay {
    my ($self, $display) = @_;
    die "abstract method setDisplay";
}


sub log {
    my ($self) = @_;
    die "abstract method log";
}

use org::allbinary::input::automation::module::actions::script::condition::processors::output::ProfileActionScriptOutputInterface;

1;

