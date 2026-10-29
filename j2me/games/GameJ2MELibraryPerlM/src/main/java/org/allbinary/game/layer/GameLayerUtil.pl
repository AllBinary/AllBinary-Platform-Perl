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

package org::allbinary::game::layer::GameLayerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isOnScreen {
    my ($class, $layer) = @_;
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $viewPosition = $layer->getViewPosition();
        return 'org::allbinary::game::layer::GameLayerUtil'->isInside($viewPosition->getX(), $viewPosition->getY(), $viewPosition->getX2(), $viewPosition->getY2(), 0, 0, $displayInfo->getLastWidth(), $displayInfo->getLastHeight());
}


sub isInside {
    my ($class, $rectX1, $rectY1, $rectX2, $rectY2, $rect2X1, $rect2Y1, $rect2X2, $rect2Y2) = @_;
        if ($rectX1 > $rect2X1 && $rectX2 < $rect2X2 && $rectY1 > $rect2Y1 && $rectY2 < $rect2Y2) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::view::ViewPositionBase;

1;

