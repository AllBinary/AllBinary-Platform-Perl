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

package org::allbinary::game::ag::ai::tactical::BasicRandomAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{i_random} = 0;
    $self->{inputProbability} = undef;
    $self->{visitor} = undef;
    $self->{keyArray} = [$javax::microedition::lcdui::Canvas::UP, $javax::microedition::lcdui::Canvas::DOWN, $javax::microedition::lcdui::Canvas::LEFT, $javax::microedition::lcdui::Canvas::RIGHT, $javax::microedition::lcdui::Canvas::KEY_NUM1, $javax::microedition::lcdui::Canvas::KEY_NUM7, $javax::microedition::lcdui::Canvas::KEY_NUM9];
    $self->{myRandomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
}


sub new {
    my ($class, $ownerLayerInterface, $gameInput, $inputProbability, $visitor) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{inputProbability} = $inputProbability;
        $self->{visitor} = $visitor;
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{inputProbability}->getTimeDelayHelper()->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
            $self->{i_random} = $self->{myRandomFactory}->getAbsoluteNextInt($self->{inputProbability}->getMax());
            my $repeat = 0;
            my $repeatLikelyhoodIntegerArray = $self->{inputProbability}->getRepeatLikelyhoodIntegerArray();
            if ($self->getLastKey() != -1 && int($repeatLikelyhoodIntegerArray->[$self->getLastKey()]) >= $self->{i_random}) {
                $repeat = 1;
            }
            if (!$repeat) {
                my $likelyhoodIntegerArray = $self->{inputProbability}->getLikelyhoodIntegerArray();
                $self->{i_random} = $self->{myRandomFactory}->getAbsoluteNextInt($self->{inputProbability}->getMax());
                my $size = scalar(@{$self->{keyArray}});
                my $likelyhoodIntegerKeyArray = undef;
                for (my $index = 0; $index < $size; $index++) {
                    my $key = $self->{keyArray}->[$index];
                    $likelyhoodIntegerKeyArray = $likelyhoodIntegerArray->[$key];
                    if (scalar(@{$likelyhoodIntegerArray}) >= $key && defined($likelyhoodIntegerKeyArray->[0])) {
                        if ($self->{i_random} >= int($likelyhoodIntegerKeyArray->[0]) && $self->{i_random} < int($likelyhoodIntegerKeyArray->[1])) {
                            $self->setLastKey($key);
                            last;
                        }
                    }
                }
            }
            $self->{visitor}->visit($self);
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::ag::ai::InputProbability;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::time::GameTickTimeDelayHelperFactory;

1;

