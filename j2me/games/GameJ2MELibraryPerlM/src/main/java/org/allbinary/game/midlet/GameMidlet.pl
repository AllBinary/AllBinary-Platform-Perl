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

package org::allbinary::game::midlet::GameMidlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'org::allbinary::midlet::ProgressMidlet','javax::microedition::lcdui::CommandListener';


sub _init_fields {
    my ($self) = @_;
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{features} = 'org::allbinary::game::configuration::feature::Features'->getInstance();
    $self->{midletStrings} = 'org::allbinary::midlet::MidletStrings'->getInstance();
    $self->{myCommandsFactory} = 'org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance();
    $self->{gameStrings} = 'org::allbinary::game::GameStrings'->getInstance();
    $self->{gameAdStateFactory} = 'org::allbinary::business::advertisement::GameAdStateFactory'->getInstance();
    $self->{gameStateFactory} = 'org::allbinary::game::state::GameStateFactory'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{DISPLAYABLE} = " Displayable: ";
    $self->{COMMAND_NAME} = "command Name/Label: ";
    $self->{NO_COMMAND} = "No Command";
    $self->{NO_DISPLAYABLE} = "No Displayable";
    $self->{COMMAND_ACTION} = 'org::allbinary::logic::string::StringMaker'->new()->append("GameMidlet::")->append($self->{midletStrings}->{COMMAND_ACTION})->toString();
    $self->{PAUSE_APP_BACKGROUND} = "pauseAppBackground";
    $self->{UN_PAUSE_APP_BACKGROUND} = "unPauseAppBackground";
    $self->{aboutCommandProcessor} = 'org::allbinary::graphics::displayable::screen::AboutCommandProcessor'->getInstance();
    $self->{webCommandProcessor} = 'org::allbinary::graphics::displayable::screen::WebCommandProcessor'->getInstance();
    $self->{gameMidletStateFactory} = 'org::allbinary::game::midlet::GameMidletStateFactory'->getInstance();
    $self->{gameStartTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(240);
    $self->{fullScreenUtil} = 'org::allbinary::canvas::FullScreenUtil'->getInstance();
    $self->{debugInterface} = undef;
    $self->{allbinaryGameCanvasRunnableInterface} = $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE;
    $self->{thread} = $org::allbinary::thread::NullThread::NULL_THREAD;
    $self->{loadGameForm} = undef;
    $self->{isFullScreen} = 0;
    $self->{resized} = 0;
    $self->{startedBefore} = 0;
}


sub new {
    my ($class, $clientInformationFactory) = @_;
    my $self = $class->SUPER::new($clientInformationFactory);
    $self->_init_fields();
        # super(...) made $self above
        'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->initWithRange(0x291, 6);
        $self->{loadGameForm} = 'org::allbinary::graphics::displayable::screen::CommandForm'->getNullCommandForm();
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->init($self);
        'org::allbinary::game::configuration::event::GameFeatureEventHandler'->getInstance()->addListenerInterface('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance());
        'org::allbinary::game::configuration::persistance::GamePersistanceSingleton'->getInstance()->clear();
        $self->{debugInterface} = 'org::allbinary::debug::DebugFactory'->getInstance();
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
}


# throws Exception
sub setDemo {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub createGame {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub mediaShutdown {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub stopAll {
    my ($self) = @_;
}


sub pauseApp {
    my ($self) = @_;
        $self->pauseAppBackground(1);
        my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
        $gameAdState->getAdvertisements()->stopAll();
}


sub pauseAppBackground {
    my ($self, $background) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{PAUSE_APP_BACKGROUND});
        if ($self->{allbinaryGameCanvasRunnableInterface} != $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE) {
            $self->{allbinaryGameCanvasRunnableInterface}->pause();
        } else {
            $self->{logUtil}->putF("<<<<<< Null", $self, $self->{PAUSE_APP_BACKGROUND});
        }
        'org::allbinary::input::AllBinarySensorManager'->getInstance()->shutdown();
}


sub unPauseApp {
    my ($self) = @_;
        $self->unPauseAppBackground(1);
        my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
        $gameAdState->getAdvertisements()->startAll();
}


sub unPauseAppBackground {
    my ($self, $background) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{UN_PAUSE_APP_BACKGROUND});
        'org::allbinary::input::AllBinarySensorManager'->getInstance()->init();
        my $gameCanvasRunnableInterface = $self->{allbinaryGameCanvasRunnableInterface};
        if ($gameCanvasRunnableInterface != $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE) {
            $gameCanvasRunnableInterface->unPause();
        } else {
            $self->{logUtil}->putF("<<<<<< Null", $self, $self->{UN_PAUSE_APP_BACKGROUND});
        }
}


sub destroyAppInRunnable {
    my ($self, $unconditional, $isProgress) = @_;
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        if ($isProgress) {
            $progressCanvas->start();
            $self->commandAction($self->{myCommandsFactory}->{SET_DISPLAYABLE}, $progressCanvas);
        }
        $self->destroyApp($unconditional);
        if ($isProgress) {
            $progressCanvas->end();
        }
}


sub destroyApp {
    my ($self, $unconditional) = @_;
        my $METHOD_NAME = "GameMidlet::destroyApp";
        try {
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::canvas::GameStatisticsFactory'->getInstance()->toString(), $self, $METHOD_NAME);
            my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
            $gameAdState->getAdvertisements()->stopAll();
            if (!$self->isDestroyed()) {
                $self->stopGameCanvasRunnableInterface();
                $self->setGameCanvasRunnableInterface($org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE);
                $self->mediaShutdown();
            } else {
                $self->{logUtil}->putF("Midlet Managment Error: Midlet Should Only Be Destroyed Once", $self, $METHOD_NAME);
            }
            $self->SUPER::destroyApp(1);
            'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{commonStrings}->{END}, $self, $METHOD_NAME);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $METHOD_NAME, $e);
        }
        $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $METHOD_NAME);
}


# throws MIDletStateChangeException
sub startApp {
    my ($self) = @_;
        try {
            my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
            $gameAdState->getAdvertisements()->startAll();
            my $START_APP = "startApp";
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $START_APP);
            my $gameCanvasRunnableInterface = $self->{allbinaryGameCanvasRunnableInterface};
            if ($gameCanvasRunnableInterface == $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE) {
                $self->{gameMidletStateFactory}->setCurrentGameState($self->{gameStateFactory}->{NO_GAME_STATE});
                $self->setDemo();
            } else {
                $self->{logUtil}->putF("GameCanvasRunnableInterface is available", $self, $START_APP);
                if ($gameCanvasRunnableInterface == $self->getCurrentDisplayable()) {
                    $self->unPauseAppBackground(0);
                } else {
                    $self->{logUtil}->putF("GameCanvasRunnableInterface is not current displayable", $self, $START_APP);
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "startApp", $e);
            $self->destroyApp(0);
            $self->notifyDestroyed();
        }
}


sub commandAction {
    my ($self, $command, $displayable) = @_;
        try {
            my $displayableAsString = $self->{NO_DISPLAYABLE};
            if (defined($displayable)) {
                $displayableAsString = $displayable->toString();
            }
            my $label = $self->{NO_COMMAND};
            if (defined($command)) {
                $label = $command->getLabel();
            }
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{COMMAND_NAME})->append($label)->append($self->{DISPLAYABLE})->append($displayableAsString)->toString(), $self, $self->{COMMAND_ACTION});
            my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
            my $allbinaryGameCanvasRunnableInterface = $self->{allbinaryGameCanvasRunnableInterface};
            my $gameCanvasRunnableInterface = $allbinaryGameCanvasRunnableInterface;
            if ($command == $gameCommandsFactory->{SHOW_GAME_CANVAS}) {
                if ($self->getDisplay()->getCurrent() != $gameCanvasRunnableInterface && $allbinaryGameCanvasRunnableInterface->getType() != $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE->getType()) {
                    $self->setDisplay($gameCanvasRunnableInterface);
                }
                $self->unPauseAppBackground(0);
            } elsif ($command == $gameCommandsFactory->{CLOSE_AND_SHOW_GAME_CANVAS}) {
                my $menuListener = $displayable;
                $menuListener->close();
                $self->setDisplay($gameCanvasRunnableInterface);
                $self->unPauseAppBackground(0);
            } elsif ($command == $gameCommandsFactory->{EXIT_COMMAND}) {
                if ('org::allbinary::game::midlet::GameMidletEventHandler'->getInstance()->getEventListenerInterfaceListP()->size() == 0) {
                    $self->exitProgress(1);
                }
                'org::allbinary::game::midlet::GameMidletEventHandler'->getInstance()->fireEvent('org::allbinary::game::midlet::DemoGameMidletEvent'->new($self, 'org::allbinary::game::midlet::DemoGameMidletStateFactory'->getInstance()->{NONE}));
            } elsif ($command == $gameCommandsFactory->{EXIT_WITHOUT_PROGRESS_COMMAND}) {
                $self->exitProgress(0);
            } elsif ($command == $gameCommandsFactory->{START_COMMAND} || $command == $gameCommandsFactory->{RESTART_COMMAND} || $command == $gameCommandsFactory->{CONTINUE_COMMAND}) {
                if ($self->{gameMidletStateFactory}->getCurrentGameState() != $self->{gameStateFactory}->{PLAYING_GAME_STATE} || $command == $gameCommandsFactory->{RESTART_COMMAND}) {
                    if ($self->{gameStartTimeHelper}->isTimeTNT()) {
                        if ($command == $gameCommandsFactory->{START_COMMAND} && $self->isDemoLoading()) {
                            $self->{logUtil}->putF("Trying to Start Game Before Loading Complete", $self, $self->{midletStrings}->{COMMAND_ACTION});
                        } else {
                            $self->{startedBefore} = 1;
                            $self->createGame();
                            $self->{gameMidletStateFactory}->setCurrentGameState($self->{gameStateFactory}->{PLAYING_GAME_STATE});
                        }
                    } else {
                        $self->{logUtil}->putF("Starting Game Too Often", $self, $self->{midletStrings}->{COMMAND_ACTION});
                    }
                } else {
                    $self->{logUtil}->putF("Already in playing state", $self, $self->{COMMAND_ACTION});
                }
            } elsif ($command == $gameCommandsFactory->{BUY_COMMAND}) {
                my $inApplicationPurchaseFactory = 'org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory'->getInstance();
                my $list = 'org::allbinary::logic::system::security::licensing::LockableFeatureFactory'->getInstance()->getList();
                my $lockableFeature = $list->get(0);
                if ($list->size() > 0 && !$inApplicationPurchaseFactory->isPurchased($lockableFeature)) {
                    $inApplicationPurchaseFactory->purchase($lockableFeature);
                } else {
                    'org::allbinary::game::input::TextNotificationUtil'->getInstance()->fireSuccess("Already Purchased");
                }
            } elsif ($command == $gameCommandsFactory->{QUIT_COMMAND}) {
                if ($self->{gameStartTimeHelper}->isTimeTNT()) {
                    if ((Scalar::Util::blessed($displayable) && $displayable->isa('org::allbinary::game::score::displayable::HighScoreTextBox'))) {
                        my $menuListener = $displayable;
                        $menuListener->close();
                    }
                    $self->stopGameCanvasRunnableInterface();
                    $self->{gameMidletStateFactory}->setCurrentGameState($self->{gameStateFactory}->{NO_GAME_STATE});
                    $self->setDemo();
                }
            } elsif ($command == $self->{myCommandsFactory}->{RESUME_COMMAND}) {
                $self->unPauseAppBackground(0);
            } elsif ($command == $self->{myCommandsFactory}->{PAUSE_COMMAND}) {
                $self->pauseAppBackground(0);
            } elsif ($command == $self->{myCommandsFactory}->{SET_DISPLAYABLE}) {
                $self->pauseAppBackground(0);
                $self->setDisplay($displayable);
            } elsif ($command == $gameCommandsFactory->{SET_MENU_DISPLAYABLE}) {
                $self->pauseAppBackground(0);
                my $menuListener = $displayable;
                $menuListener->open();
                $self->setDisplay($displayable);
            } elsif ($command == $gameCommandsFactory->{START_TRACE}) {
                $self->{debugInterface}->start();
                my $gameCanvas = $allbinaryGameCanvasRunnableInterface;
                $gameCanvas->addCommand($gameCommandsFactory->{STOP_TRACE});
                $gameCanvas->removeCommand($gameCommandsFactory->{START_TRACE});
            } elsif ($command == $gameCommandsFactory->{STOP_TRACE}) {
                $self->pauseAppBackground(0);
                $self->{debugInterface}->stop();
                $self->unPauseAppBackground(0);
                my $gameCanvas = $allbinaryGameCanvasRunnableInterface;
                $gameCanvas->addCommand($gameCommandsFactory->{START_TRACE});
                $gameCanvas->removeCommand($gameCommandsFactory->{STOP_TRACE});
            } elsif ($command == $gameCommandsFactory->{DEFAULT_OPTIONS}) {
                my $tempDisplayable = $displayable;
                if ((Scalar::Util::blessed($tempDisplayable) && $tempDisplayable->isa('org::allbinary::game::configuration::GameOptionsForm'))) {
                    'org::allbinary::game::configuration::feature::GameFeatureFormUtil'->getInstance()->setDefault($tempDisplayable);
                }
            } elsif ($command == $org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas::DISPLAY) {
                my $tempDisplayable = $displayable;
                if ((Scalar::Util::blessed($tempDisplayable) && $tempDisplayable->isa('org::allbinary::game::displayable::canvas::GameInputMappingCanvas'))) {
                    my $gameInputMappingCanvas = $tempDisplayable;
                    $gameInputMappingCanvas->update();
                }
                $self->commandAction($gameCommandsFactory->{SET_MENU_DISPLAYABLE}, $self->getInputMappingInstructionsCanvas());
            } elsif ('org::allbinary::game::score::HighScoreCommandsFactory'->getInstance()->isHighScoreCommand($command)) {
                my $tempDisplayable = $displayable;
                if ((Scalar::Util::blessed($tempDisplayable) && $tempDisplayable->isa('org::allbinary::game::score::displayable::HighScoresCanvas'))) {
                    my $highScoresCanvas = $tempDisplayable;
                    $highScoresCanvas->updateCommand($command);
                }
            } elsif ($command == 'org::allbinary::game::score::HighScoreCommands'->getInstance()->{DISPLAY}) {
                $self->commandAction($gameCommandsFactory->{SET_MENU_DISPLAYABLE}, $self->createHighScoresCanvas());
            } elsif ($command == $org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas::CLOSE) {
                my $menuListener = $displayable;
                $menuListener->close();
                $self->commandAction($org::allbinary::game::displayable::canvas::GameInputMappingCanvas::DISPLAY, $javax::microedition::lcdui::NullCanvas::NULL_CANVAS);
            } elsif ($command == $org::allbinary::game::displayable::canvas::GameInputMappingCanvas::DISPLAY) {
                if ('org::allbinary::J2MEUtil'->isHTML()) {
                    $self->pauseAppBackground(0);
                }
                $self->commandAction($gameCommandsFactory->{SET_MENU_DISPLAYABLE}, $self->getInputMappingCanvas());
            } elsif ($command == $org::allbinary::game::displayable::canvas::GameInputMappingCanvas::DEFAULT) {
                my $tempDisplayable = $displayable;
                if ((Scalar::Util::blessed($tempDisplayable) && $tempDisplayable->isa('org::allbinary::game::displayable::canvas::GameInputMappingCanvas'))) {
                    my $gameInputMappingCanvas = $tempDisplayable;
                    $gameInputMappingCanvas->setDefault();
                }
            } elsif ($command == $org::allbinary::game::configuration::InGameOptionsForm::DISPLAY) {
                $self->pauseAppBackground(0);
                my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
                $progressCanvas->addNormalPortion(50, "In Game Options");
                my $layerManager = $self->createGameLayerManager();
                my $inGameOptionsFormFactory = 'org::allbinary::game::configuration::InGameOptionsFormFactory'->getInstance();
                $inGameOptionsFormFactory->init($self, 'org::allbinary::game::configuration::InGameFeatures'->new(), "Options In Game", $layerManager->getBackgroundBasicColor(), $layerManager->getForegroundBasicColor());
                my $inGameOptionsForm = $inGameOptionsFormFactory->get();
                $inGameOptionsForm->setItemStateListener($allbinaryGameCanvasRunnableInterface);
                $self->commandAction($gameCommandsFactory->{SET_MENU_DISPLAYABLE}, $inGameOptionsForm);
            } elsif ($command == $org::allbinary::game::configuration::InGameOptionsForm::DEFAULT) {
                my $inGameOptionsForm = 'org::allbinary::game::configuration::InGameOptionsFormFactory'->getInstance()->get();
                'org::allbinary::game::configuration::feature::GameFeatureFormUtil'->getInstance()->setDefault($inGameOptionsForm);
            } elsif ($command == $gameCommandsFactory->{DISPLAY_OPTIONS}) {
                'org::allbinary::media::audio::AllBinaryMediaManager'->setMuted(1);
                $self->stopAll();
                my $mainFeatureFactory = 'org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance();
                $self->{isFullScreen} = $self->{features}->isFeature($mainFeatureFactory->{FULL_SCREEN});
                'org::allbinary::graphics::ResizableListenerHandler'->getInstance()->fireEvent(1);
                $self->setResized(0);
                $self->commandAction($gameCommandsFactory->{SET_MENU_DISPLAYABLE}, $self->getGameOptionsForm());
            } elsif ($command == $gameCommandsFactory->{CLOSE_OPTIONS}) {
                'org::allbinary::graphics::ResizableListenerHandler'->getInstance()->fireEvent(0);
                $self->commandAction($gameCommandsFactory->{CLOSE_AND_SHOW_GAME_CANVAS}, $displayable);
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Close isFullScreen/change: ");
                $stringBuffer->appendboolean($self->{isFullScreen});
                $stringBuffer->appendboolean($self->{fullScreenUtil}->isScreenChange($self->{isFullScreen}));
                $stringBuffer->append(" isResized: ");
                $stringBuffer->appendboolean($self->isResized());
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, $self->{COMMAND_ACTION});
                if ($self->isResized() || $self->{fullScreenUtil}->isScreenChange($self->{isFullScreen})) {
                    $self->updateFullScreen();
                }
                'org::allbinary::media::audio::AllBinaryMediaManager'->setMuted(0);
            } elsif ($command == $gameCommandsFactory->{DISPLAY_LOAD_FORM}) {
                $self->pauseAppBackground(0);
                my $keyValuePersistance = 'org::allbinary::game::configuration::persistance::GamePersistanceSingleton'->getInstance();
                $keyValuePersistance->clear();
                $keyValuePersistance->loadAll($self->{abeClientInformation});
                if ($self->getLoadGameForm() == 'org::allbinary::graphics::displayable::screen::CommandForm'->getNullCommandForm()) {
                    my $layerManager = $self->createGameLayerManager();
                    $self->setLoadGameForm('org::allbinary::game::configuration::LoadGameForm'->new($self, "Load Game", $layerManager->getBackgroundBasicColor(), $layerManager->getForegroundBasicColor()));
                } else {
                    $self->getLoadGameForm()->update();
                }
                $self->commandAction($gameCommandsFactory->{SET_MENU_DISPLAYABLE}, $self->getLoadGameForm());
            } elsif ($command == $gameCommandsFactory->{LOAD_FILE}) {
                my $loadGameForm = $self->getLoadGameForm();
                my $index = $loadGameForm->getSelectedId();
                if ($index != -1) {
                    my $keyValuePersistance = 'org::allbinary::game::configuration::persistance::GamePersistanceSingleton'->getInstance();
                    $self->setStartStateHashtable($keyValuePersistance->get($index));
                    my $menuListener = $self->getLoadGameForm();
                    $menuListener->close();
                    'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance()->toString(), $self, $self->{COMMAND_ACTION});
                    $self->commandAction($gameCommandsFactory->{START_COMMAND}, $javax::microedition::lcdui::NullCanvas::NULL_CANVAS);
                    'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance()->toString(), $self, $self->{COMMAND_ACTION});
                }
            } elsif ($command == $gameCommandsFactory->{DELETE_FILE}) {
                my $loadGameForm = $self->getLoadGameForm();
                my $index = $loadGameForm->getSelectedText();
                if ($index != -1) {
                    my $keyValuePersistance = 'org::allbinary::game::configuration::persistance::GamePersistanceSingleton'->getInstance();
                    $keyValuePersistance->delete($self->{abeClientInformation}, $index);
                    $keyValuePersistance->clear();
                    $keyValuePersistance->loadAllSize($self->{abeClientInformation}, 1);
                    $self->getLoadGameForm()->update();
                }
            } elsif ($command == $gameCommandsFactory->{SAVE}) {
                my $keyValuePersistance = 'org::allbinary::game::configuration::persistance::GamePersistanceSingleton'->getInstance();
                $self->pauseAppBackground(0);
                $keyValuePersistance->save($self->{abeClientInformation}, $self->getCurrentStateHashtable());
                $self->unPauseAppBackground(0);
            } elsif ($command == $org::allbinary::game::score::displayable::HighScoreUtil::SUBMIT_TEXTBOX_COMMAND) {
                $self->{logUtil}->putF("Submitted Score", $self, $self->{COMMAND_ACTION});
                if ((Scalar::Util::blessed($displayable) && $displayable->isa('org::allbinary::game::score::displayable::HighScoreTextBox'))) {
                    my $highScoreTextBox = $displayable;
                    $highScoreTextBox->{submitted} = 1;
                }
                $allbinaryGameCanvasRunnableInterface->setHighScoreSubmitted(1);
                $self->commandAction($gameCommandsFactory->{CLOSE_AND_SHOW_GAME_CANVAS}, $displayable);
            } elsif ($command == $gameCommandsFactory->{DISPLAY_ABOUT}) {
                $self->{aboutCommandProcessor}->process($self, $gameCommandsFactory->{SET_MENU_DISPLAYABLE}, $self->getAboutCanvas());
            } elsif ($command == $gameCommandsFactory->{OPEN_WEB_URL}) {
                $self->{webCommandProcessor}->process($self, $gameCommandsFactory->{OPEN_WEB_URL}, $javax::microedition::lcdui::NullCanvas::NULL_CANVAS);
            } elsif ($command == $gameCommandsFactory->{TOGGLE_KEYBOARD}) {
                my $virtualKeyboardEventHandler = 'org::allbinary::input::event::VirtualKeyboardEventHandler'->getInstance();
                $virtualKeyboardEventHandler->fireEvent($virtualKeyboardEventHandler->{SHOW_EVENT});
            } elsif ($self->{tsUtil}->compareTo($command->getLabel(), $gameCommandsFactory->{TOGGLE_FULLSCREEN}->getLabel()) == 0) {
                my $mainFeatureFactory = 'org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance();
                my $isFullScreen = $self->{features}->isFeature($mainFeatureFactory->{FULL_SCREEN});
                if ($isFullScreen) {
                    $self->{features}->removeDefault($mainFeatureFactory->{FULL_SCREEN});
                } else {
                    $self->{features}->addDefault($mainFeatureFactory->{FULL_SCREEN});
                }
                $self->updateFullScreen();
            }
        } catch ($e) {
            $self->{logUtil}->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{EXCEPTION_LABEL})->append($command->getLabel())->toString(), $self, $self->{midletStrings}->{COMMAND_ACTION}, $e);
            if ($command != 'org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{EXIT_COMMAND}) {
                $self->exitProgress(0);
            }
        }
}


sub updateFullScreen {
    my ($self) = @_;
        my $mainFeatureFactory = 'org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance();
        my $isFullScreen = $self->{features}->isFeature($mainFeatureFactory->{FULL_SCREEN});
        my $displayable = $self->getDisplay()->getCurrent();
        if ((Scalar::Util::blessed($displayable) && $displayable->isa('javax::microedition::lcdui::Canvas'))) {
            my $canvas = $displayable;
            $canvas->setFullScreenMode($isFullScreen);
        }
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub getInputMappingInstructionsCanvas {
    my ($self) = @_;
        return 'org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas'->new($self, $self->createGameLayerManager());
}


# throws Exception
sub getInputMappingCanvas {
    my ($self) = @_;
        return 'org::allbinary::game::displayable::canvas::GameInputMappingCanvas'->new($self->{abeClientInformation}, $self, $self->createGameLayerManager(), $self->getHelpPaintable());
}


# throws Exception
sub getAboutCanvas {
    my ($self) = @_;
        return 'org::allbinary::game::displayable::canvas::BasicPaintablesCanvas'->new($self, 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{ABOUT}, $self->createGameLayerManager(), 'org::allbinary::graphics::displayable::screen::AboutPaintableFactory'->getInstance()->{paintableArray});
}


# throws Exception
sub getHelpPaintable {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub createHighScoresCanvas {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub startGameCanvasRunnableInterface {
    my ($self) = @_;
        my $threadFactoryUtil = 'org::allbinary::thread::ThreadFactoryUtil'->getInstance();
        $self->{thread} = $threadFactoryUtil->getInstanceGameCanvasRunnable($self->{allbinaryGameCanvasRunnableInterface});
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Thread Priority: ")->appendint(int($self->{thread}->getPriority()))->toString(), $self, "startGameCanvasRunnableInterface");
        $self->{allbinaryGameCanvasRunnableInterface}->setThread($self->{thread});
        $threadFactoryUtil->start($self->{thread});
}


# throws Exception
sub stopGameCanvasRunnableInterface {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{gameStrings}->{STOP_GAME_CANVAS_RUNNABLE_INTERFACE});
        'org::allbinary::game::layer::hud::event::GameNotificationEventHandler'->getInstance()->removeAllListeners();
        'org::allbinary::graphics::color::ColorChangeEventHandler'->getInstance()->removeAllListeners();
        'org::allbinary::game::displayable::canvas::GameEventHandlerUtil'->removeAllListeners();
        my $gameCanvasRunnableInterface = $self->{allbinaryGameCanvasRunnableInterface};
        if ($gameCanvasRunnableInterface != $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Set Running False: ")->append($gameCanvasRunnableInterface->toString())->toString(), $self, $self->{gameStrings}->{STOP_GAME_CANVAS_RUNNABLE_INTERFACE});
            $gameCanvasRunnableInterface->setRunning(0);
        } else {
            $self->{logUtil}->putF("StopGame - Could Not Stop", $self, $self->{gameStrings}->{STOP_GAME_CANVAS_RUNNABLE_INTERFACE});
        }
        'org::allbinary::thread::ThreadUtil'->getInstance()->join($self->{thread});
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        if ($self->{features}->isFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{LOAD_ALL})) {
            $progressCanvas->addNormalPortion(50, "Stopped Game Runnable");
        } else {
            $progressCanvas->addNormalPortion(50, "Stopped Main Runnable");
        }
        $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{gameStrings}->{STOP_GAME_CANVAS_RUNNABLE_INTERFACE});
}


sub getGameCanvasRunnableInterface {
    my ($self) = @_;
        return $self->{allbinaryGameCanvasRunnableInterface};
}


sub setGameCanvasRunnableInterface {
    my ($self, $gameCanvasRunnableInterface) = @_;
        $self->{allbinaryGameCanvasRunnableInterface} = $gameCanvasRunnableInterface;
}


sub createGameLayerManager {
    my ($self) = @_;
        my $gameInfo = 'org::allbinary::game::GameInfo'->new('org::allbinary::game::GameTypeFactory'->getInstance()->{SINGLE_PLAYER}, $org::allbinary::game::GameMode::SERVER, 'org::allbinary::game::PlayerTypesFactory'->getInstance()->{PLAYER_TYPE_ONE}, 1, 1);
        return 'org::allbinary::game::layer::AllBinaryGameLayerManager'->new($self->{basicColorFactory}->{BLACK}, $self->{basicColorFactory}->{WHITE}, $gameInfo);
}


sub getGameOptionsForm {
    my ($self) = @_;
        my $layerManager = $self->createGameLayerManager();
        return 'org::allbinary::game::configuration::GameOptionsFormFactory'->getInstance()->init($self, "Game Options", $layerManager->getBackgroundBasicColor(), $layerManager->getForegroundBasicColor());
}


# throws Exception
sub save {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{SAVE});
        my $hashtable = $self->getCurrentStateHashtable();
        'org::allbinary::game::configuration::persistance::GamePersistanceSingleton'->getInstance()->save($self->{abeClientInformation}, $hashtable);
}


# throws Exception
sub getCurrentStateHashtable {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getCurrentStateHashtable");
        my $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        if ($self->{allbinaryGameCanvasRunnableInterface} != $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE) {
            my $currentHashtable = $self->{allbinaryGameCanvasRunnableInterface}->getCurrentStateHashtable();
            my $enumeration = $currentHashtable->keys();
            my $key = undef;
            while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
                $key = $self->{enumerationUtil}->nextElement($enumeration);
                $hashtable->put($key, $currentHashtable->get($key));
            }
        }
        return $hashtable;
}


sub setLoadGameForm {
    my ($self, $loadGameForm) = @_;
        $self->{loadGameForm} = $loadGameForm;
}


sub getLoadGameForm {
    my ($self) = @_;
        return $self->{loadGameForm};
}


sub setResized {
    my ($self, $resized) = @_;
        $self->{resized} = $resized;
}


sub isResized {
    my ($self) = @_;
        return $self->{resized};
}


sub isDemoLoading {
    my ($self) = @_;
        if ($self->{startedBefore}) {
            return 0;
        }
        my $displayable = $self->getDisplay()->getCurrent();
        if ((Scalar::Util::blessed($displayable) && $displayable->isa('org::allbinary::game::displayable::canvas::DemoCanvas'))) {
            my $demoCanvas = $displayable;
            if ($demoCanvas->isDemoLoading()) {
                return 1;
            }
        }
        return 0;
}

use java::util::Enumeration;
# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Displayable;
# use javax::microedition::lcdui::NullCanvas;
# use javax::microedition::midlet::MIDletStateChangeException;
use org::allbinary::J2MEUtil;
use org::allbinary::TsUtil;
use org::allbinary::business::advertisement::GameAdStateFactory;
use org::allbinary::canvas::FullScreenUtil;
use org::allbinary::canvas::GameStatisticsFactory;
use org::allbinary::debug::DebugFactory;
use org::allbinary::debug::DebugInterface;
use org::allbinary::game::GameAdState;
use org::allbinary::game::GameInfo;
use org::allbinary::game::GameMode;
use org::allbinary::game::GameStrings;
use org::allbinary::game::GameTypeFactory;
use org::allbinary::game::PlayerTypesFactory;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::GameOptionsForm;
use org::allbinary::game::configuration::GameOptionsFormFactory;
use org::allbinary::game::configuration::InGameFeatures;
use org::allbinary::game::configuration::InGameOptionsForm;
use org::allbinary::game::configuration::InGameOptionsFormFactory;
use org::allbinary::game::configuration::LoadGameForm;
use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::game::configuration::event::GameFeatureEventHandler;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFormUtil;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::game::configuration::persistance::GamePersistanceSingleton;
use org::allbinary::game::configuration::persistance::KeyValuePersistance;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::displayable::canvas::BasicPaintablesCanvas;
use org::allbinary::game::displayable::canvas::DemoCanvas;
use org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface;
use org::allbinary::game::displayable::canvas::GameEventHandlerUtil;
use org::allbinary::game::displayable::canvas::GameInputMappingCanvas;
use org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas;
use org::allbinary::game::displayable::canvas::MenuListener;
use org::allbinary::game::displayable::canvas::NullGameCanvasRunnable;
use org::allbinary::game::input::TextNotificationUtil;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::hud::event::GameNotificationEventHandler;
use org::allbinary::game::paint::help::HelpPaintable;
use org::allbinary::game::score::HighScoreCommands;
use org::allbinary::game::score::HighScoreCommandsFactory;
use org::allbinary::game::score::displayable::HighScoreTextBox;
use org::allbinary::game::score::displayable::HighScoreUtil;
use org::allbinary::game::score::displayable::HighScoresCanvas;
use org::allbinary::game::state::GameStateFactory;
use org::allbinary::graphics::ResizableListenerHandler;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::ColorChangeEventHandler;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::graphics::displayable::command::MyCommandsFactory;
use org::allbinary::graphics::displayable::screen::AboutCommandProcessor;
use org::allbinary::graphics::displayable::screen::AboutPaintableFactory;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::graphics::displayable::screen::WebCommandProcessor;
use org::allbinary::input::AllBinarySensorManager;
use org::allbinary::input::event::VirtualKeyboardEventHandler;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::ClientInformationFactory;
use org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory;
use org::allbinary::logic::system::security::licensing::LockableFeature;
use org::allbinary::logic::system::security::licensing::LockableFeatureFactory;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::media::audio::AllBinaryMediaManager;
use org::allbinary::midlet::MidletStrings;
use org::allbinary::midlet::ProgressMidlet;
use org::allbinary::thread::NullThread;
use org::allbinary::thread::ThreadFactoryUtil;
use org::allbinary::thread::ThreadUtil;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::EnumerationUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::midlet::GameMidletStateFactory;
use org::allbinary::game::midlet::GameMidletEventHandler;
use org::allbinary::game::midlet::DemoGameMidletEvent;
use org::allbinary::game::midlet::DemoGameMidletStateFactory;

1;

