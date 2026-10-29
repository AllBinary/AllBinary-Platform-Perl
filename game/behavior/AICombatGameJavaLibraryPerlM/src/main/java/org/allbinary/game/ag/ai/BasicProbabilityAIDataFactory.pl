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

package org::allbinary::game::ag::ai::BasicProbabilityAIDataFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self) = @_;
        my $likelyhoodIntegerArray = [map { [(undef) x (2)] } 1 .. ($javax::microedition::lcdui::Canvas::KEY_NUM9 + 1)];
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::UP]->[0] = $smallIntegerSingletonFactory->getAt(0);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::UP]->[1] = $smallIntegerSingletonFactory->getAt(10);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::DOWN]->[0] = $smallIntegerSingletonFactory->getAt(10);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::DOWN]->[1] = $smallIntegerSingletonFactory->getAt(14);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::LEFT]->[0] = $smallIntegerSingletonFactory->getAt(14);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::LEFT]->[1] = $smallIntegerSingletonFactory->getAt(18);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::RIGHT]->[0] = $smallIntegerSingletonFactory->getAt(18);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::RIGHT]->[1] = $smallIntegerSingletonFactory->getAt(22);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM7]->[0] = $smallIntegerSingletonFactory->getAt(22);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM7]->[1] = $smallIntegerSingletonFactory->getAt(26);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM9]->[0] = $smallIntegerSingletonFactory->getAt(26);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM9]->[1] = $smallIntegerSingletonFactory->getAt(30);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM1]->[0] = $smallIntegerSingletonFactory->getAt(30);
        $likelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM1]->[1] = $smallIntegerSingletonFactory->getAt(40);
        my $repeatLikelyhoodIntegerArray = [(undef) x ($javax::microedition::lcdui::Canvas::KEY_NUM9 + 1)];
        $repeatLikelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::UP] = $smallIntegerSingletonFactory->getAt(0);
        $repeatLikelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::DOWN] = $smallIntegerSingletonFactory->getAt(0);
        $repeatLikelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::LEFT] = $smallIntegerSingletonFactory->getAt(0);
        $repeatLikelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::RIGHT] = $smallIntegerSingletonFactory->getAt(0);
        $repeatLikelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM7] = $smallIntegerSingletonFactory->getAt(0);
        $repeatLikelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM9] = $smallIntegerSingletonFactory->getAt(0);
        $repeatLikelyhoodIntegerArray->[$javax::microedition::lcdui::Canvas::KEY_NUM1] = $smallIntegerSingletonFactory->getAt(10);
        my $inputProbability = 'org::allbinary::game::ag::ai::InputProbability'->new($likelyhoodIntegerArray, $repeatLikelyhoodIntegerArray, 42, $org::allbinary::time::NoTimeDelayHelper::SINGLETON);
        return $inputProbability->toHashtable();
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::time::NoTimeDelayHelper;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::InputProbability;

1;

