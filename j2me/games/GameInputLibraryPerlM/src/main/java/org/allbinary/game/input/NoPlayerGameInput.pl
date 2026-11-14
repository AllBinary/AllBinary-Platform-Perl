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

package org::allbinary::game::input::NoPlayerGameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInput';

tie our $SINGLETON, 'java::lang::LazyStatic', sub { 'org::allbinary::game::input::NoPlayerGameInput'->new() };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::NoPlayerGameInput::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::util::BasicArrayListD'->new(), 'org::allbinary::util::BasicArrayListD'->new(), -1);
        # super(...) made $self above
    return $self;
}


sub onDownGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
}


sub onUpGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::input::event::GameKeyEvent ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::game::input::PlayerGameInput ();

1;

