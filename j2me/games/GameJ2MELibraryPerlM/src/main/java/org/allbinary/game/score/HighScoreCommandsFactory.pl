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

package org::allbinary::game::score::HighScoreCommandsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoreCommandsBaseFactory';

our $instance = 'org::allbinary::game::score::HighScoreCommandsFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::score::HighScoreCommandsFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(['org::allbinary::game::score::HighScoreCommands'->getInstance()->{PERSONAL}, 'org::allbinary::game::score::HighScoreCommands'->getInstance()->{WORLD}]);
        # super(...) made $self above
    return $self;
}

# use javax::microedition::lcdui::Command;
use org::allbinary::game::score::HighScoreCommandsBaseFactory;
use org::allbinary::game::score::HighScoreCommands;

1;

