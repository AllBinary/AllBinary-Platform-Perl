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

package org::allbinary::game::ag::layer::pickup::health::HealLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayer','org::allbinary::game::health::HealthVisitorInterface';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::graphics::Rectangle'->new('org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO}, 0, 0), 'org::allbinary::view::ViewPosition'->getInstanceD());
        # super(...) made $self above
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
}


sub visit {
    my ($self, $healthInterface) = @_;
        if ($healthInterface->isAlive()) {
            $healthInterface->healMax();
        } else {
            $self->{logUtil}->putF("Heal attempt on dead: Does not currently occur", $self, "visit");
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::health::HealthInterface;
use org::allbinary::game::health::HealthVisitorInterface;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::view::ViewPosition;

1;

