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

package org::allbinary::game::input::MapSelectionGameInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor','org::allbinary::game::input::GameInputProcessorInterface','org::allbinary::game::input::PlayerGameInputCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameCanvas} = undef;
    $self->{raceTrackGeographicMapInterfaceFactoryInterface} = undef;
    $self->{preGameSelectorPaintable} = undef;
    $self->{inputTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(650);
    $self->{playerGameInput} = undef;
    $self->{lockedIndex} = undef;
    $self->{abRunnable} = do {
        package org::allbinary::thread::ABRunnable::AnonymousN66461 { our @ISA = ('org::allbinary::thread::ABRunnable');
        

        sub run {
            my ($self) = @_;
            try {
                $self->setRunning(1);
                'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
                my $track = $self->{preGameSelectorPaintable}->getPreGameSelectionForm()->getSelectedIndex() + 1;
                my $wave = $self->{raceTrackGeographicMapInterfaceFactoryInterface}->getFirstWaveWithTrack($track);
                $self->{gameCanvas}->getLayerManager()->getGameInfo()->setCurrentLevel($wave);
                $self->{gameCanvas}->buildGameInit(0);
                'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->removeListener($self->getPlayerGameInput());
                $self->setRunning(0);
            } catch ($e) {
                $self->setRunning(0);
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            }
        }
        }
        'org::allbinary::thread::ABRunnable::AnonymousN66461'->can('new') ? 'org::allbinary::thread::ABRunnable::AnonymousN66461'->new() : bless({}, 'org::allbinary::thread::ABRunnable::AnonymousN66461')
    };
}


sub new {
    my ($class, $gameCanvas, $raceTrackGeographicMapInterfaceFactoryInterface, $mapSelectorPaintable, $lockedIndex) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{gameCanvas} = $gameCanvas;
        $self->{raceTrackGeographicMapInterfaceFactoryInterface} = $raceTrackGeographicMapInterfaceFactoryInterface;
        $self->{preGameSelectorPaintable} = $mapSelectorPaintable;
        $self->{playerGameInput} = 'org::allbinary::game::input::GameInputProcessorComposite'->new("Map Selection", $self);
        $self->{lockedIndex} = $lockedIndex;
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->getPlayerGameInput()->update();
}


# throws Exception
sub onInput {
    my ($self, $list) = @_;
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $list->get($index);
            my $key = 'org::allbinary::game::input::event::GameKeyEventUtil'->getKey($anyType);
            if ($key == $javax::microedition::lcdui::Canvas::LEFT || $key == $javax::microedition::lcdui::Canvas::RIGHT || $key == $javax::microedition::lcdui::Canvas::UP || $key == $javax::microedition::lcdui::Canvas::DOWN) {
                if ($self->{inputTimeHelper}->isTimeTNT()) {
                    'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->add('org::allbinary::media::audio::SelectSound'->getInstance());
                    $self->{preGameSelectorPaintable}->getPreGameSelectionForm()->processInputKey($key);
                    last;
                }
            } elsif ($key == $javax::microedition::lcdui::Canvas::KEY_NUM0) {
                my $selectedIndex = $self->{preGameSelectorPaintable}->getPreGameSelectionForm()->getSelectedIndex();
                if ($selectedIndex < $self->{lockedIndex} || !'org::allbinary::logic::system::security::licensing::LockedUtil'->getInstance()->isLocked()) {
                    if (!$self->{abRunnable}->isRunning()) {
                        $self->{abRunnable}->setRunning(1);
                        'org::allbinary::thread::ThreadObjectUtil'->getInstance()->processThread($self->{abRunnable});
                    }
                    last;
                } else {
                    'org::allbinary::logic::system::security::licensing::LockedFeatureNotificationUtil'->getInstance()->fire();
                }
            }
            $list->clear();
        }
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
}


sub initInputProcessors {
    my ($self) = @_;
}


sub getName {
    my ($self) = @_;
        return $self->toString();
}


sub getPlayerGameInput {
    my ($self) = @_;
        return $self->{playerGameInput};
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::system::security::licensing::LockedFeatureNotificationUtil;
use org::allbinary::logic::system::security::licensing::LockedUtil;
use org::allbinary::canvas::Processor;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::displayable::canvas::PreGameSelectorPaintable;
use org::allbinary::game::input::event::GameKeyEventHandler;
use org::allbinary::game::input::event::GameKeyEventUtil;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::media::audio::SelectSound;
use org::allbinary::media::graphics::geography::map::racetrack::MultiLevelRaceTrackGeographicMapInterfaceFactoryInterface;
use org::allbinary::thread::ABRunnable;
use org::allbinary::thread::ThreadObjectUtil;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::game::input::GameInputProcessorInterface;
use org::allbinary::game::input::PlayerGameInputCompositeInterface;
use org::allbinary::game::input::GameInputProcessorComposite;

1;

