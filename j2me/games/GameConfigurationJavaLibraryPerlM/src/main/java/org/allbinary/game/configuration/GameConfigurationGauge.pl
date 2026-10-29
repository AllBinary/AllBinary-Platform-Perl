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

package org::allbinary::game::configuration::GameConfigurationGauge;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::Gauge';



sub new {
    my ($class, $gameConfiguration) = @_;
    my $self = $class->SUPER::new($gameConfiguration->getName(), $gameConfiguration->isModifiable(), int($gameConfiguration->getMaxValue()) - int($gameConfiguration->getMinValue()), int($gameConfiguration->getValue()) - int($gameConfiguration->getMinValue()));
        # super(...) made $self above
    return $self;
}

# use javax::microedition::lcdui::Gauge;

1;

