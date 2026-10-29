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

package org::allbinary::game::displayable::canvas::DemoCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::RunnableCanvas','org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface','org::allbinary::game::displayable::canvas::MenuListener','org::allbinary::graphics::displayable::event::DisplayChangeEventListener','org::allbinary::game::displayable::canvas::DemoPaintableInterface';

our $id = 0;
our $BOT_GAME_STATS = "Bot Game Statistics: ";
our $TYPE = 3;

sub _init_fields {
    my ($self) = @_;
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{myCommandsFactory} = 'org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance();
    $self->{gameAdStateFactory} = 'org::allbinary::business::advertisement::GameAdStateFactory'->getInstance();
    $self->{gameInputStrings} = 'org::allbinary::game::input::GameInputStrings'->getInstance();
    $self->{gameStateFactory} = 'org::allbinary::game::state::GameStateFactory'->getInstance();
    $self->{threadFactoryUtil} = 'org::allbinary::thread::ThreadFactoryUtil'->getInstance();
    $self->{formUtil} = 'org::allbinary::game::displayable::canvas::FormUtil'->getInstance();
    $self->{fullscreenPaintable} = 'org::allbinary::graphics::displayable::screen::FullScreenPaintableFactory'->getInstance()->{paintable};
    $self->{basicGameDemoPaintable} = 'org::allbinary::graphics::paint::StatePaintableFactory'->getInstance();
    $self->{specialAnimationInterface} = 'org::allbinary::animation::special::SpecialAnimation'->getInstance();
    $self->{paintedSpecialAnimationInterface} = 'org::allbinary::animation::special::SpecialAnimation'->getInstance();
    $self->{fullScreenUtil} = 'org::allbinary::canvas::FullScreenUtil'->getInstance();
    $self->{gameCanvas} = 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance();
    $self->{highScoresHelper} = 'org::allbinary::game::score::HighScoresHelper'->new();
    $self->{realHighScoresPaintable} = 'org::allbinary::game::score::HighScoresPaintable'->new();
    $self->{highScoresPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{state} = 0;
    $self->{canvasThread} = $org::allbinary::thread::NullThread::NULL_THREAD;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(6000);
    $self->{basicColor} = $self->{basicColorFactory}->{RED};
    $self->{abeClientInformation} = undef;
    $self->{highScoresFactoryInterface} = undef;
    $self->{menuInputProcessor} = 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->getInstance();
    $self->{menuForm} = 'org::allbinary::graphics::form::ScrollSelectionForm'->getNullScrollSelectionForm();
    $self->{gameInitializationInterfaceFactoryInterface} = undef;
    $self->{initialized} = 0;
    $self->{demoGameRunnable} = undef;
    $self->{defaultPaintableInterface} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{paintableInterface} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{overlayPaintable} = undef;
    $self->{progressPaintable} = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getLazyInstance();
    $self->{tempWait} = 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance()->{WAIT};
    $self->{inputToGameKeyMapping} = 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance()->getInputMapping();
    $self->{gameRunnable} = 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance();
    $self->{isSingleKeyRepeatableProcessing} = 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_REPEAT_PRESS});
    $self->{NONE} = 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{NONE};
    $self->{gameKeyEventFactory} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
    $self->{lastKeyNotMapped} = -1;
    $self->{SET_STATE} = "setState";
    $self->{baseGameStatistics} = 'org::allbinary::canvas::GameStatisticsFactory'->getInstance();
}


sub new {
    my ($class, $abeClientInformation, $commandListener, $highScoresFactoryInterface, $paintable, $overlayPaintable, $gameInitializationInterfaceFactoryInterface, $isContinue) = @_;
    my $self = $class->SUPER::new($commandListener, 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance()->{DEFAULT_CHILD_NAME_LIST}, 1);
    $self->_init_fields();
        # super(...) made $self above
        $self->{abeClientInformation} = $abeClientInformation;
        $self->setWait('org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance()->{WAIT});
        $self->{gameInitializationInterfaceFactoryInterface} = $gameInitializationInterfaceFactoryInterface;
        'org::allbinary::game::init::GameInitializationUtil'->getInstance()->initDemo($abeClientInformation, $self, $gameInitializationInterfaceFactoryInterface);
        'org::allbinary::graphics::ResizableListenerHandler'->getInstance()->fireEvent(0);
        $self->{overlayPaintable} = $overlayPaintable;
        $self->{highScoresFactoryInterface} = $highScoresFactoryInterface;
        $self->setDefaultPaintableInterface($paintable);
        $self->setPaintableInterface($self->getDefaultPaintableInterface());
        if ($isContinue) {
            $self->addCommand('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{CONTINUE_COMMAND});
        }
        if ('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->isChangedFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{SOUND})) {
            $self->mediaInit();
        }
        $self->{demoGameRunnable} = 'org::allbinary::game::displayable::canvas::DemoGameStartupRunnable'->new($self);
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->addListenerInterface($self);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonLabels}->{START_LABEL})->append($self->{displayInfo}->toString())->toString(), $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT});
            my $scrollSelectionForm = $self->getMenuForm();
            if (defined($scrollSelectionForm)) {
                my $formType = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->getFormType();
                my $rectangle = $self->{formUtil}->createFormRectangle();
                $scrollSelectionForm->init($rectangle, $formType);
            }
            $self->{overlayPaintable}->init();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT}, $e);
        }
}


sub getCustomCommands {
    my ($self) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        if ('org::allbinary::J2MEUtil'->isHTML()) {
            my $commandArray = [$gameCommandsFactory->{START_COMMAND}, 'org::allbinary::game::score::HighScoreCommands'->getInstance()->{DISPLAY}, $org::allbinary::game::displayable::canvas::GameInputMappingCanvas::DISPLAY, $gameCommandsFactory->{DISPLAY_ABOUT}];
            return $commandArray;
        } else {
            my $commandList = 'org::allbinary::util::BasicArrayListD'->new();
            $commandList->add($gameCommandsFactory->{START_COMMAND});
            my $inApplicationPurchaseFactory = 'org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory'->getInstance();
            if ($inApplicationPurchaseFactory->isEnabled()) {
                my $list = 'org::allbinary::logic::system::security::licensing::LockableFeatureFactory'->getInstance()->getList();
                if ($list->size() > 0 && !$inApplicationPurchaseFactory->isPurchased($list->get(0))) {
                    $commandList->add($gameCommandsFactory->{BUY_COMMAND});
                }
            }
            $commandList->add('org::allbinary::game::score::HighScoreCommands'->getInstance()->{DISPLAY});
            try {
                my $isOverScan = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance()->isOverScan();
                if ($org::allbinary::game::layer::SWTUtil::isSWT) {
                    $commandList->add($org::allbinary::game::displayable::canvas::GameInputMappingCanvas::DISPLAY);
                } elsif (!$isOverScan) {
                    $commandList->add($gameCommandsFactory->{DISPLAY_OPTIONS});
                    $commandList->add($gameCommandsFactory->{DISPLAY_LOAD_FORM});
                    $commandList->add($org::allbinary::game::displayable::canvas::GameInputMappingCanvas::DISPLAY);
                }
            } catch ($e) {
            }
            $commandList->add($gameCommandsFactory->{DISPLAY_ABOUT});
            my $commandArray = $commandList->toArray();
            return $commandArray;
        }
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        my $commandArray = $self->getCustomCommands();
        my $size = scalar(@{$commandArray});
        for (my $index = 0; $index < $size; $index++) {
            $self->addCommand($commandArray->[$index]);
        }
        'org::allbinary::canvas::CustomGameMenuUtil'->add($self);
        $self->setCommandListener($cmdListener);
}


# throws Exception
sub initPostPaint {
    my ($self) = @_;
}


# throws Exception
sub mediaInit {
    my ($self) = @_;
        'org::allbinary::media::audio::AllBinaryMediaManager'->init('org::allbinary::media::audio::EarlySoundsFactory'->getInstance());
}


sub itemStateChanged {
    my ($self, $item) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
}


# throws Exception
sub initMenu {
    my ($self) = @_;
        $self->close();
        my $commandTextItemArrayFactory = 'org::allbinary::game::displayable::canvas::DemoLimitedCommandTextItemArrayFactory'->getInstance()->getCommandTextItemArrayFactory();
        my $items = $commandTextItemArrayFactory->getInstance($self->getCommandStack(), $self->{basicColorFactory}->{BLACK}, $self->{basicColorFactory}->{WHITE});
        my $formType = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->getFormType();
        my $rectangle = $self->{formUtil}->createFormRectangle();
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonLabels}->{START_LABEL})->append($self->{displayInfo}->toString())->toString(), $self, "initMenu");
        my $scrollSelectionForm = 'org::allbinary::graphics::form::CommandCurrentSelectionFormFactory'->getInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $items, $rectangle, $formType, 15, 1, $self->{basicColorFactory}->{BLACK}, $self->{basicColorFactory}->{WHITE});
        $self->setMenuForm($scrollSelectionForm);
        my $formType2 = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->getFormType();
        my $rectangle2 = $self->{formUtil}->createFormRectangle();
        $scrollSelectionForm->init($rectangle2, $formType2);
        if ($self->getMenuForm() != 'org::allbinary::graphics::form::ScrollSelectionFormNoneFactory'->getInstance()) {
            $self->setMenuInputProcessor('org::allbinary::game::displayable::canvas::CommandFormInputProcessor'->new('org::allbinary::util::BasicArrayListD'->new(), -1, $self, $self->getMenuForm()));
        }
        $self->open();
}


sub open {
    my ($self) = @_;
        'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance()->addListenerInterface($self->getMenuInputProcessor());
        'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->addListener($self->getMenuInputProcessor());
}


sub close {
    my ($self) = @_;
        'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance()->removeListener($self->getMenuInputProcessor());
        'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->removeListener($self->getMenuInputProcessor());
}


sub getSourceId {
    my ($self) = @_;
        return $org::allbinary::game::displayable::canvas::DemoCanvas::id;
}


sub keyPressed {
    my ($self, $keyCode) = @_;
        $self->keyPressedByDevice($keyCode, 0);
}


sub keyReleased {
    my ($self, $keyCode) = @_;
        $self->keyReleasedByDevice($keyCode, 0);
}


sub keyRepeated {
    my ($self, $keyCode) = @_;
        $self->keyRepeatedByDevice($keyCode, 0);
}


sub keyPressedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        $self->addGameKeyEvent($keyCode, 0);
}


sub keyReleasedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        $self->removeGameKeyEvent($keyCode, 0);
}


sub keyRepeatedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        if ($self->{isSingleKeyRepeatableProcessing}) {
            $self->addGameKeyEvent($keyCode, 1);
        }
}


sub addGameKeyEvent {
    my ($self, $keyCode, $repeated) = @_;
        try {
            my $gameKey = $self->{inputToGameKeyMapping}->getInstanceForCanvas($self, $keyCode);
            if ($gameKey != $self->{NONE}) {
                my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($self, $gameKey);
                'org::allbinary::game::input::event::DownGameKeyEventHandler'->getInstance()->fireEvent($gameKeyEvent);
            } else {
                if ($self->{lastKeyNotMapped} != $keyCode) {
                    $self->{lastKeyNotMapped} = $keyCode;
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{NO_KEY})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{ADD_KEY_EVENT});
                }
            }
        } catch ($e) {
            $self->{logUtil}->put("Key Event Error", $self, $self->{gameInputStrings}->{ADD_KEY_EVENT}, $e);
        }
}


sub removeGameKeyEvent {
    my ($self, $keyCode, $repeated) = @_;
        try {
            my $gameKey = $self->{inputToGameKeyMapping}->getInstanceForCanvas($self, $keyCode);
            if ($gameKey != $self->{NONE}) {
                my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($self, $gameKey);
                'org::allbinary::game::input::event::UpGameKeyEventHandler'->getInstance()->fireEvent($gameKeyEvent);
            } else {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{NO_KEY})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{REMOVE_KEY_EVENT});
            }
        } catch ($e) {
            $self->{logUtil}->put("Key Event Error", $self, $self->{gameInputStrings}->{REMOVE_KEY_EVENT}, $e);
        }
}


sub pause {
    my ($self) = @_;
        $self->close();
        $self->setPaused(1);
        $self->{gameRunnable} = 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance();
        $self->{gameCanvas}->pause();
}


sub unPause {
    my ($self) = @_;
        $self->open();
        $self->{gameCanvas}->unPause();
        $self->{gameRunnable} = $self->{gameCanvas}->{gameRunnable};
        $self->setPaused(0);
}


sub isPausable {
    my ($self) = @_;
        if ('org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance()->getUsedRunnable() == 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance()) {
            return 1;
        } else {
            return 0;
        }
}


sub isGameOver {
    my ($self) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{NOT_IMPLEMENTED})->append(" since not a game")->toString(), $self, "isGameOver");
        return 0;
}


# throws Exception
sub setLoadStateHashtable {
    my ($self, $hashtable) = @_;
        $self->{logUtil}->putF("Trying to continue a demo lol - only continue a game canvas not the demo", $self, "setLoadStateHashtable");
}


# throws Exception
sub getLoadStateHashtable {
    my ($self) = @_;
        $self->{logUtil}->putF("Trying to continue a demo lol - only continue a game canvas not the demo", $self, "getLoadStateHashtable");
        return $self->{stdUtil}->{NULL_TABLE};
}


# throws Exception
sub getCurrentStateHashtable {
    my ($self) = @_;
        $self->{logUtil}->putF("Trying to save the AI lol", $self, "getCurrentStateHashtable");
        return $self->{stdUtil}->{NULL_TABLE};
}


sub setHighScoreSubmitted {
    my ($self, $isNotUsed) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{paintableInterface}->paint($graphics);
        $self->{paintedSpecialAnimationInterface}->paintXY($graphics, 0, 0);
        $self->{highScoresPaintable}->paint($graphics);
        $self->getBasicGameDemoPaintable()->paint($graphics);
        $self->{overlayPaintable}->paint($graphics);
        $self->{fullscreenPaintable}->paint($graphics);
        $self->{progressPaintable}->paint($graphics);
}


sub paintThreed {
    my ($self, $graphics) = @_;
        $self->{paintableInterface}->paintThreed($graphics);
        $self->{paintedSpecialAnimationInterface}->paintThreedXYZ($graphics, 0, 0, 0);
}


sub processGameOver {
    my ($self) = @_;
        $self->{logUtil}->putF("Not Implemented since not a game", $self, "setGameOver");
}


sub demoStateChange {
    my ($self) = @_;
        my $newState = $self->{state} + 1;
        if ($newState > 2) {
            $newState = 0;
        } elsif ($newState == 2) {
            if (!$self->{highScoresHelper}->isAnyHighScores()) {
                $newState = 0;
            } else {
                my $highScores = $self->{highScoresHelper}->getNextHighScores();
                if ($highScores == 'org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance()) {
                    $newState = 0;
                } else {
                    $self->getRealHighScoresPaintable()->setHighScores($highScores);
                }
            }
        }
        $self->setState($newState);
        $self->updateDemoState();
}


sub updateDemoState {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->createInstance($self->{state})->toString(), $self, $self->{SET_STATE});
        $self->getBasicGameDemoPaintable()->setState($self->{state});
        if ($self->{state} == 0) {
            $self->{highScoresPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
            $self->{paintedSpecialAnimationInterface} = $self->getSpecialAnimationInterface();
            if (!$self->{demoGameRunnable}->isRunning() && $self->{gameCanvas}->isInitialized()) {
                $self->getSpecialAnimationInterface()->reset();
            }
        } elsif ($self->{state} == 1) {
            $self->{paintedSpecialAnimationInterface} = 'org::allbinary::animation::special::SpecialAnimation'->getInstance();
        } elsif ($self->{state} == 2) {
            $self->{highScoresPaintable} = $self->getRealHighScoresPaintable();
        }
        my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
        $gameAdState->processPageAdState();
}


# throws Exception
sub getNextRandom {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub createGameLayerManager {
    my ($self, $randomValue) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub createRunnable {
    my ($self, $randomLevel) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub create {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{commonStrings}->{START}, $self, "create");
        $self->{highScoresPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
        my $randomLevel = $self->getNextRandom();
        $self->{gameCanvas} = $self->createRunnable($randomLevel);
        $self->{basicColor} = $self->{gameCanvas}->getLayerManager()->getForegroundBasicColor();
        $self->getRealHighScoresPaintable()->setBasicColorP($self->{basicColor});
        $self->{gameCanvas}->setGameCanvasStartListener($self);
        my $gameInfo = $self->{gameCanvas}->getLayerManager()->getGameInfo();
        $self->getHighScoresFactoryInterface()->fetchHighScores($gameInfo, $self->{highScoresHelper});
}


# throws Exception
sub start {
    my ($self) = @_;
        my $gameCanvas = $self->{gameCanvas};
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Game Thread in DemoCanvas: ")->append($self->{stringUtil}->toString($gameCanvas))->toString(), $self, $self->{commonStrings}->{START});
        $self->{canvasThread} = $self->{threadFactoryUtil}->getInstanceGameCanvasRunnable($gameCanvas);
        $self->{gameCanvas}->setThread($self->{canvasThread});
        $self->{threadFactoryUtil}->start($self->{canvasThread});
        if ($self->getWait() == 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance()->{WAIT}) {
            $self->setWait($self->getTempWait());
        }
}


sub preDemoProcess {
    my ($self) = @_;
        if (!$self->{gameCanvas}->isInitialized() || $self->{gameCanvas}->getTitle() == $org::allbinary::game::displayable::canvas::NullGameCanvas::NO_GAME) {
            if ('org::allbinary::media::audio::AllBinaryMediaManager'->update()) {
                if (!'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance()->process()) {
                    'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance()->process();
                }
            }
        }
        $self->{overlayPaintable}->update();
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->SUPER::process();
        $self->getMenuInputProcessor()->processInputList();
        $self->preDemoProcess();
        if ($self->{state} == 0) {
            my $indexedAnimationBehavior = ($self->getSpecialAnimationInterface()->getAnimationBehavior());
            if ($indexedAnimationBehavior->{loopIndex} < 1) {
                $self->{timeDelayHelper}->setStartTimeTNT();
            }
            my $demoGameMidlet = $self->getCustomCommandListener();
            if ($self->{gameCanvas} != 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance() && $self->{gameCanvas}->isGameOver()) {
                $self->stopGameDemo();
                my $randomLevel = $self->getNextRandom();
                my $gameInfo = $self->{gameCanvas}->getLayerManager()->getGameInfo();
                $gameInfo->setCurrentLevel($randomLevel);
                $self->{gameCanvas}->setGameOver(0);
                $self->start();
            } elsif ($self->{gameCanvas} == 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance() && $demoGameMidlet->isReady()) {
                if (!$self->{demoGameRunnable}->isRunning()) {
                    $self->startDemoGame();
                    $self->{demoGameRunnable}->setRunning(1);
                    my $thread = $self->{threadFactoryUtil}->getInstanceForRunnable($self->{demoGameRunnable});
                    $self->{demoGameRunnable}->setThread($thread);
                    $self->{threadFactoryUtil}->start($thread);
                }
            }
        }
}


# throws Exception
sub startDemoGame {
    my ($self) = @_;
        'org::allbinary::game::displayable::canvas::DemoCanvasProgressUtil'->showProgress($self);
}


# throws Exception
sub stopGameDemo {
    my ($self) = @_;
        if ($self->{gameCanvas} != 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance()) {
            $self->{logUtil}->putF("Set Running False", $self, "stopGameDemo");
            $self->{gameCanvas}->setRunning(0);
        }
        'org::allbinary::thread::ThreadUtil'->getInstance()->join($self->{canvasThread});
}


sub showGamePaintable {
    my ($self) = @_;
        my $METHOD_NAME = "showGamePaintable";
        'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{commonStrings}->{START}, $self, $METHOD_NAME);
        my $isDefault = 'org::allbinary::J2MEUtil'->isHTML();
        if ($self->{gameCanvas} != 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance() && ($self->{gameCanvas}->isRunning() || $isDefault || $org::allbinary::game::layer::SWTUtil::isSWT) && !($self->{gameCanvas}->getType() == $org::allbinary::game::displayable::canvas::NullGameCanvas::TYPE)) {
            $self->{gameRunnable} = $self->{gameCanvas}->{gameRunnable};
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Showing Game", $self, $METHOD_NAME);
            $self->setPaintableInterface($self->{gameCanvas});
        } else {
            $self->{gameRunnable} = 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Not Showing Game", $self, $METHOD_NAME);
            $self->setPaintableInterface($self->getDefaultPaintableInterface());
        }
}


sub isReadyForStateChange {
    my ($self) = @_;
        return !$self->{demoGameRunnable}->isRunning() && $self->{gameCanvas}->isInitialized();
}


# throws Exception
sub processGame {
    my ($self) = @_;
        $self->{gameRunnable}->run();
        if (!$self->{specialAnimationInterface}->isComplete() && $self->isReadyForStateChange()) {
            $self->{specialAnimationInterface}->nextFrame();
        }
        if ($self->{timeDelayHelper}->isTimeTNT() && $self->isReadyForStateChange()) {
            $self->demoStateChange();
        } else {
            $self->process();
        }
}


sub run {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
        try {
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
            $progressCanvas->addNormalPortion(50, "Demo Thread");
            $self->setCurrentThread();
            $self->setRunning(1);
            if ($features->isFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{LOAD_ONDEMAND})) {
                $progressCanvas->end();
            } else {
                $progressCanvas->addNormalPortion(50, "Demo Thread Running");
            }
            $self->{fullScreenUtil}->initOnRun($self, $self->getCustomCommandListener());
            $self->initMenu();
            $self->initPostPaint();
            $self->updateDemoState();
            if ($features->isDefault($openGLFeatureFactory->{OPENGL_AS_GAME_THREAD})) {
                while ($self->{gameCanvas} == 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance() || !$self->{gameCanvas}->isInitialized()) {
                    $self->{loopTimeHelper}->setStartTimeTNT();
                    $self->processGame();
                    $self->processLoopSleep();
                }
                my $demoGameRunnable = 'org::allbinary::game::displayable::canvas::DemoGameRunnable'->new($self);
                my $currentDisplayableFactory = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance();
                $currentDisplayableFactory->setRunnable($demoGameRunnable);
                $currentDisplayableFactory->setMyCanvas($self);
                'org::allbinary::graphics::opengles::OpenGLThreadUtil'->getInstance()->onResume();
            }
            if ($features->isDefault($openGLFeatureFactory->{OPENGL_AS_GAME_THREAD}) || 'org::allbinary::J2MEUtil'->isHTML()) {
                my $demoGameRunnable = 'org::allbinary::game::displayable::canvas::DemoGameRunnable'->new($self);
                my $currentDisplayableFactory = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance();
                $currentDisplayableFactory->setRunnable($demoGameRunnable);
                $currentDisplayableFactory->setMyCanvas($self);
            } else {
                while ($self->isRunning()) {
                    $self->run3();
                }
                $self->end();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
        $self->{logUtil}->putF($self->{commonStrings}->{END_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
}


# throws Exception
sub run3 {
    my ($self) = @_;
        $self->{loopTimeHelper}->setStartTimeTNT();
        $self->processGame();
        $self->processLoopSleep();
}


sub setRunning {
    my ($self, $running) = @_;
        $self->SUPER::setRunning($running);
        try {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
            if ($running) {
            } else {
                if (($features->isDefault($openGLFeatureFactory->{OPENGL}) || 'org::allbinary::J2MEUtil'->isHTML()) || $org::allbinary::game::layer::SWTUtil::isSWT) {
                    my $currentDisplayableFactory = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance();
                    $currentDisplayableFactory->clearRunnable();
                    $self->end();
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{SET_RUNNING}, $e);
        }
}


# throws Exception
sub end {
    my ($self) = @_;
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        $self->{baseGameStatistics}->add('org::allbinary::logic::string::StringMaker'->new()->append($org::allbinary::game::displayable::canvas::DemoCanvas::BOT_GAME_STATS)->append($self->{baseGameStatistics}->toString())->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE})->toString());
        $self->{baseGameStatistics}->init();
        if ($features->isFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{LOAD_ONDEMAND})) {
            $progressCanvas->start();
        }
        $self->{logUtil}->putF("Demo End", $self, $self->{commonStrings}->{RUN});
        $self->close();
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->removeListener($self);
        $self->stopGameDemo();
}


sub setGameState {
    my ($self, $gameState) = @_;
}


sub getGameState {
    my ($self) = @_;
        return $self->{gameStateFactory}->{PLAYING_GAME_STATE};
}


sub getGameCanvasRunnableInterface {
    my ($self) = @_;
        return $self->{gameCanvas};
}


sub isDemoLoading {
    my ($self) = @_;
        my $gameCanvas = $self->{gameCanvas};
        if ($gameCanvas == 'org::allbinary::game::displayable::canvas::NullGameCanvas'->getInstance()) {
            return 1;
        } elsif ($gameCanvas->isInitialized()) {
            return 0;
        }
        return 1;
}


sub getState {
    my ($self) = @_;
        return $self->{state};
}


sub setState {
    my ($self, $state) = @_;
        $self->{state} = $state;
}


sub isHighScoreSubmitted {
    my ($self) = @_;
        $self->{logUtil}->putF("Wow the AI got a high score!", $self, "isHighScoreSubmitted");
        return 0;
}


sub getRealHighScoresPaintable {
    my ($self) = @_;
        return $self->{realHighScoresPaintable};
}


sub setSpecialAnimationInterface {
    my ($self, $specialAnimationInterface) = @_;
        $specialAnimationInterface->setFrame(0);
        $self->{specialAnimationInterface} = $specialAnimationInterface;
}


sub getSpecialAnimationInterface {
    my ($self) = @_;
        return $self->{specialAnimationInterface};
}


sub setPaintableInterface {
    my ($self, $paintableInterface) = @_;
        $self->{paintableInterface} = $paintableInterface;
}


sub getPaintableInterface {
    my ($self) = @_;
        return $self->{paintableInterface};
}


sub setDefaultPaintableInterface {
    my ($self, $defaultPaintableInterface) = @_;
        $self->{defaultPaintableInterface} = $defaultPaintableInterface;
}


sub getDefaultPaintableInterface {
    my ($self) = @_;
        return $self->{defaultPaintableInterface};
}


sub getHighScoresFactoryInterface {
    my ($self) = @_;
        return $self->{highScoresFactoryInterface};
}


sub setMenuInputProcessor {
    my ($self, $menuInputProcessor) = @_;
        $self->{menuInputProcessor} = $menuInputProcessor;
}


sub getMenuInputProcessor {
    my ($self) = @_;
        return $self->{menuInputProcessor};
}


sub getMenuForm {
    my ($self) = @_;
        return $self->{menuForm};
}


sub setMenuForm {
    my ($self, $menuForm) = @_;
        $self->{menuForm} = $menuForm;
}


sub isInitialized {
    my ($self) = @_;
        return $self->{initialized};
}


sub getOverlayPaintable {
    my ($self) = @_;
        return $self->{overlayPaintable};
}


sub setBasicGameDemoPaintable {
    my ($self, $basicGameDemoPaintable) = @_;
        $self->{basicGameDemoPaintable} = $basicGameDemoPaintable;
}


sub getBasicGameDemoPaintable {
    my ($self) = @_;
        return $self->{basicGameDemoPaintable};
}


sub setTempWait {
    my ($self, $tempWait) = @_;
        $self->{tempWait} = $tempWait;
}


sub getTempWait {
    my ($self) = @_;
        return $self->{tempWait};
}


sub isSingleThread {
    my ($self) = @_;
        return 'org::allbinary::graphics::opengles::OpenGLFeatureUtil'->getInstance()->isAnyThreed() || $org::allbinary::game::layer::SWTUtil::isSWT;
}


sub isRunningInAnotherThread {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
        if ($features->isDefault($openGLFeatureFactory->{OPENGL_AS_GAME_THREAD})) {
            return 1;
        } else {
            return $self->isRunning();
        }
}


sub getGameInitializationInterfaceFactoryInterface {
    my ($self) = @_;
        return $self->{gameInitializationInterfaceFactoryInterface};
}


sub getType {
    my ($self) = @_;
        return $org::allbinary::game::displayable::canvas::DemoCanvas::TYPE;
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Item;
use org::allbinary::J2MEUtil;
use org::allbinary::animation::Animation;
use org::allbinary::animation::IndexedAnimationBehavior;
use org::allbinary::animation::special::SpecialAnimation;
use org::allbinary::business::advertisement::GameAdStateFactory;
use org::allbinary::canvas::BaseGameStatistics;
use org::allbinary::canvas::CustomGameMenuUtil;
use org::allbinary::canvas::FullScreenUtil;
use org::allbinary::canvas::GameStatisticsFactory;
use org::allbinary::canvas::RunnableCanvas;
use org::allbinary::game::GameAdState;
use org::allbinary::game::GameInfo;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::game::init::BasicBuildGameInitializerFactory;
use org::allbinary::game::init::GameInitializationUtil;
use org::allbinary::game::input::GameInputStrings;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::event::DownGameKeyEventHandler;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::game::input::event::GameKeyEventHandler;
use org::allbinary::game::input::event::UpGameKeyEventHandler;
use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::SWTUtil;
use org::allbinary::game::midlet::DemoGameMidlet;
use org::allbinary::game::score::HighScoreCommands;
use org::allbinary::game::score::HighScores;
use org::allbinary::game::score::HighScoresFactoryInterface;
use org::allbinary::game::score::HighScoresHelper;
use org::allbinary::game::score::HighScoresHelperBase;
use org::allbinary::game::score::HighScoresPaintable;
use org::allbinary::game::score::NullHighScoresSingletonFactory;
use org::allbinary::game::state::GameState;
use org::allbinary::game::state::GameStateFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::ResizableListenerHandler;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::command::MyCommandsFactory;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::displayable::event::DisplayChangeEventHandler;
use org::allbinary::graphics::displayable::event::DisplayChangeEventListener;
use org::allbinary::graphics::displayable::screen::FullScreenPaintableFactory;
use org::allbinary::graphics::form::CommandCurrentSelectionFormFactory;
use org::allbinary::graphics::form::FormType;
use org::allbinary::graphics::form::FormTypeFactory;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::form::ScrollSelectionFormNoneFactory;
use org::allbinary::graphics::form::item::CommandTextItemArrayFactory;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::opengles::CurrentDisplayableFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::graphics::opengles::OpenGLThreadUtil;
use org::allbinary::graphics::paint::InitUpdatePaintable;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::graphics::paint::StatePaintable;
use org::allbinary::graphics::paint::StatePaintableFactory;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory;
use org::allbinary::logic::system::security::licensing::LockableFeature;
use org::allbinary::logic::system::security::licensing::LockableFeatureFactory;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::media::audio::AllBinaryMediaManager;
use org::allbinary::media::audio::EarlySoundsFactory;
use org::allbinary::media::audio::PrimaryPlayerQueueFactory;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::string::CommonSeps;
use org::allbinary::thread::NullThread;
use org::allbinary::thread::ThreadFactoryUtil;
use org::allbinary::thread::ThreadUtil;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface;
use org::allbinary::game::displayable::canvas::MenuListener;
use org::allbinary::game::displayable::canvas::DemoPaintableInterface;
use org::allbinary::game::displayable::canvas::FormUtil;
use org::allbinary::game::displayable::canvas::NullGameCanvas;
use org::allbinary::game::displayable::canvas::NoMenuInputProcessor;
use org::allbinary::game::displayable::canvas::NullWaitGameRunnable;
use org::allbinary::game::displayable::canvas::DemoGameStartupRunnable;
use org::allbinary::game::displayable::canvas::GameInputMappingCanvas;
use org::allbinary::game::displayable::canvas::DemoLimitedCommandTextItemArrayFactory;
use org::allbinary::game::displayable::canvas::CommandFormInputProcessor;
use org::allbinary::game::displayable::canvas::DemoCanvasProgressUtil;
use org::allbinary::game::displayable::canvas::DemoGameRunnable;

1;

