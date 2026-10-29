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

package org::allbinary::game::combat::canvas::CombatGameCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::AllBinaryGameCanvas';

our $basicLayerProcessor = [(undef) x (0)];


sub new {
    my ($class, $cmdListener, $gameLayerManager, $highScoresFactoryInterface, $gameInitializationInterfaceFactoryInterface, $buffered) = @_;
    my $self = $class->SUPER::new($cmdListener, $gameLayerManager, $highScoresFactoryInterface, $gameInitializationInterfaceFactoryInterface, $buffered);
        # super(...) made $self above
    return $self;
}


sub CombatGameCanvas_init {
    my ($self) = @_;
        'org::allbinary::game::combat::destroy::event::DestroyEventCircularStaticPool'->getInstance()->init($self);
        'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance()->addNormalPortion(50, "Destroy Events");
}


# throws Exception
sub initApp {
    my ($self, $abeClientInformation) = @_;
        $self->CombatGameCanvas_init();
        $self->SUPER::initApp($abeClientInformation);
}


sub initConfigurablePortion {
    my ($self, $portion) = @_;
        'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->init();
        'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance()->addNormalPortion($portion, "Basic Processors");
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $gameFeatureFactory = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
        if ($features->isFeature($gameFeatureFactory->{DROPPED_ITEMS}) && $features->isFeature($gameFeatureFactory->{DROPPED_ITEMS_FROM_DEATH})) {
            $org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor = [(undef) x (2)];
            $org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor->[0] = 'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->getInstance();
            $org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor->[1] = 'org::allbinary::game::layer::drop::DropLayerProcessor'->getInstance();
        } else {
            $org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor = [(undef) x (1)];
            $org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor->[0] = 'org::allbinary::game::combat::destroy::DestroyedLayerProcessor'->getInstance();
        }
}


# throws Exception
sub processPlayingGame {
    my ($self) = @_;
        $self->SUPER::processPlayingGame();
        for (my $index = scalar(@{$org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor}); --$index >= 0; ) {
            $org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor->[$index]->process($self->{gameLayerManager});
        }
}


# throws Exception
sub cleanupGame {
    my ($self) = @_;
        $self->SUPER::cleanupGame();
        for (my $index = scalar(@{$org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor}); --$index >= 0; ) {
            $org::allbinary::game::combat::canvas::CombatGameCanvas::basicLayerProcessor->[$index]->getList()->clear();
        }
        'org::allbinary::game::layer::identification::GroupLayerManagerListener'->getInstance()->clear();
        'org::allbinary::game::layer::identification::GroupLayerManagerListener'->getInstance()->log();
        'org::allbinary::game::combat::destroy::event::DestroyedEventHandler'->getInstance()->removeAllListeners();
        $self->cleanupManager();
}


# throws Exception
sub cleanupManager {
    my ($self) = @_;
        $self->{gameLayerManager}->cleanup();
}

# use javax::microedition::lcdui::CommandListener;
use org::allbinary::game::combat::destroy::DestroyedLayerProcessor;
use org::allbinary::game::combat::destroy::event::DestroyEventCircularStaticPool;
use org::allbinary::game::combat::destroy::event::DestroyedEventHandler;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::init::BasicBuildGameInitializerFactory;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::drop::DropLayerProcessor;
use org::allbinary::game::layer::identification::GroupLayerManagerListener;
use org::allbinary::game::score::HighScoresFactoryInterface;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::layer::BasicLayerProcessor;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;

1;

