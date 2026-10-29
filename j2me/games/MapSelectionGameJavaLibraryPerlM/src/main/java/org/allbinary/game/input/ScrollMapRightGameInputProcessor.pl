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

package org::allbinary::game::input::ScrollMapRightGameInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::ScrollMapGameInputProcessor';



sub new {
    my ($class, $scrollMapPlayerGameInput) = @_;
    my $self = $class->SUPER::new($scrollMapPlayerGameInput);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processEvent {
    my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
        $self->{scrollMapPlayerGameInput}->right();
}

use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::game::input::ScrollMapGameInputProcessor;

1;

