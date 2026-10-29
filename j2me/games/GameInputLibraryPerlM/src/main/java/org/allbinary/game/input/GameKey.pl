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

package org::allbinary::game::input::GameKey;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::Input';

our $NULL_GAME_KEY = 'org::allbinary::game::input::GameKey'->new(-1, 'org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING});


sub new {
    my ($class, $key, $name) = @_;
    my $self = $class->SUPER::new($key, $name);
        # super(...) made $self above
    return $self;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append("GameKey ")->append($self->SUPER::toString())->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::input::Input;

1;

