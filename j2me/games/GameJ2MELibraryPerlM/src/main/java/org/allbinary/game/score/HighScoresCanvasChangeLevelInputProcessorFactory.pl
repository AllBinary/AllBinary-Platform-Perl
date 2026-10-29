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

package org::allbinary::game::score::HighScoresCanvasChangeLevelInputProcessorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresCanvasInputProcessorFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $highScoresCanvas) = @_;
        return 'org::allbinary::game::score::HighScoresCanvasLevelChangeInputProcessor'->new($highScoresCanvas);
}

use org::allbinary::game::score::displayable::HighScoresCanvas;
use org::allbinary::game::score::HighScoresCanvasInputProcessorFactoryInterface;
use org::allbinary::game::score::HighScoresCanvasLevelChangeInputProcessor;

1;

