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

package org::allbinary::game::ag::ai::scroller::HorizontalScreenPatrolAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::ai::BasicAI';

our $SOUND = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(433);

sub _init_fields {
    my ($self) = @_;
    $self->{keyDirection} = $javax::microedition::lcdui::Canvas::LEFT;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{firingX} = $self->{displayInfoSingleton}->getLastHalfWidth();
    $self->{firedIndex} = 0;
    $self->{MAX_FIRE} = 28;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(240);
    $self->{secondaryPlayerQueue} = 'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance();
    $self->{sound} = undef;
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{sound} = $hashtable->get($org::allbinary::game::ag::ai::scroller::HorizontalScreenPatrolAI::SOUND);
        if (!defined($self->{sound})) {
            die ("No Sound Provided!!");
        }
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        $self->SUPER::processKeyAI($self->{keyDirection});
        if ($self->{timeDelayHelper}->isTimeTNT()) {
            my $layerInterface = $self->getOwnerLayerInterface();
            my $currentOwnerLayerX = $layerInterface->getXP();
            if ($currentOwnerLayerX < -$layerInterface->getWidth()) {
                my $y = 'org::allbinary::game::rand::MyRandomFactory'->getInstance()->getAbsoluteNextIntAllowZero(50);
                $layerInterface->setPosition($self->{displayInfoSingleton}->getLastWidth() + $layerInterface->getWidth() + 50, $y, $layerInterface->getZP());
                $self->{firedIndex} = 0;
                $self->{firingX} = $self->{displayInfoSingleton}->getLastHalfWidth() + 'org::allbinary::game::rand::MyRandomFactory'->getInstance()->getNextInt($self->{displayInfoSingleton}->getLastHalfWidth());
                $self->{secondaryPlayerQueue}->add($self->{sound});
            }
            if ($currentOwnerLayerX < $self->{firingX} && $currentOwnerLayerX > -$layerInterface->getWidth()) {
                $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM1);
                my $gameLayerManager = $allBinaryLayerManager;
                my $FIRE = POSIX::floor((($gameLayerManager->getGameInfo()->getCurrentLevel() + 12)) / (2 ** (2)));
                if ($FIRE > $self->{MAX_FIRE}) {
                    $FIRE = $self->{MAX_FIRE};
                }
                if ($self->{firedIndex} > $FIRE) {
                    $self->{firedIndex} = 0;
                    $self->{firingX} = (-2147483648);
                }
                $self->{firedIndex}++;
            }
        }
}


sub nextDirection {
    my ($self) = @_;
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::audio::PlayerQueue;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::media::audio::Sound;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;

1;

