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

package org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use Scalar::Util ();
use parent -norequire,'org::allbinary::canvas::RunnableCanvas','org::allbinary::game::displayable::canvas::AllBinaryGameCanvasInterface','org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface','org::allbinary::game::displayable::canvas::MenuListener','org::allbinary::game::IntermissionCompositeInterface','org::allbinary::game::IntermissionEnableListenerInterface','org::allbinary::game::displayable::canvas::PopupMenuInterface','org::allbinary::graphics::displayable::event::DisplayChangeEventListener','org::allbinary::graphics::font::UpdateMyFontInterface';

our $id = 0;
our $TYPE = 2;

sub _init_fields {
    my ($self) = @_;
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{touchFeatureFactory} = 'org::allbinary::game::configuration::feature::TouchFeatureFactory'->getInstance();
    $self->{openGLFeatureFactory} = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
    $self->{touchButtonFactory} = 'org::allbinary::input::motion::button::TouchButtonFactory'->getInstance();
    $self->{gameAdStateFactory} = 'org::allbinary::business::advertisement::GameAdStateFactory'->getInstance();
    $self->{gameStrings} = 'org::allbinary::game::GameStrings'->getInstance();
    $self->{gameInputStrings} = 'org::allbinary::game::input::GameInputStrings'->getInstance();
    $self->{gameStateFactory} = 'org::allbinary::game::state::GameStateFactory'->getInstance();
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
    $self->{gameTickDisplayInfoSingleton} = 'org::allbinary::graphics::displayable::GameTickDisplayInfoSingleton'->getInstance();
    $self->{gameRunnable} = 'org::allbinary::game::displayable::canvas::GameCanvasRunnable'->new($self);
    $self->{gamePauseRunnable} = 'org::allbinary::game::displayable::canvas::GameCanvasPauseRunnable'->new($self);
    $self->{formUtil} = 'org::allbinary::game::displayable::canvas::FormUtil'->getInstance();
    $self->{myFormUtil} = 'org::allbinary::game::displayable::canvas::MyFormUtil'->getInstance();
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{gameSpecificPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{sensorGameUpdateProcessor} = 'org::allbinary::input::gyro::SingleSensorGameUpdateProcessor'->new();
    $self->{endGameInfo} = 'org::allbinary::game::displayable::canvas::EndGameInfo'->new();
    $self->{startIntermissionInterface} = 'org::allbinary::game::Intermission'->new();
    $self->{endLevelIntermissionInterface} = 'org::allbinary::game::Intermission'->new();
    $self->{gameLayerManager} = 'org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance();
    $self->{gameState} = $self->{gameStateFactory}->{NO_GAME_STATE};
    $self->{gameOver} = 0;
    $self->{initialized} = 0;
    $self->{gameStateTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{highScoresHelper} = undef;
    $self->{highScoreSubmitted} = 0;
    $self->{realHighScoresPaintable} = 'org::allbinary::game::score::HighScoresPaintable'->new();
    $self->{highScoresPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{localPlayerGameInputList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{isCheating} = 0;
    $self->{hashtable} = $self->{stdUtil}->{NULL_TABLE};
    $self->{isSingleKeyRepeatableProcessing} = 0;
    $self->{gameInitializationInterfaceFactoryInterface} = $org::allbinary::game::init::BasicBuildGameInitializerFactory::NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY;
    $self->{touchButtonsPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{touchPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{cheatProcessor} = 'org::allbinary::game::input::NoPlayerGameInput'->getInstance();
    $self->{gameInputProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{endGameProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{realEndGameProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{startIntermissionProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{realStartIntermissionProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{endGamePaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{endGameStatePaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{nonBotPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{intermissionPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{startIntermissionPaintable} = 'org::allbinary::graphics::paint::NullInitUpdatePaintable'->getInstance();
    $self->{mainStateProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{processGameProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{highScoresFactoryInterface} = undef;
    $self->{startLevel} = 0;
    $self->{mainMenuInputProcessor} = 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->getInstance();
    $self->{popupMenuInputProcessor} = 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->getInstance();
    $self->{menuInputProcessor} = 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->getInstance();
    $self->{menuForm} = 'org::allbinary::graphics::form::ScrollSelectionForm'->getNullScrollSelectionForm();
    $self->{formPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{openMenuPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{menuPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{currentTouchInputFactory} = 'org::allbinary::input::motion::button::NoButtonsTouchInputFactory'->getInstance();
    $self->{colorFillPaintable} = 'org::allbinary::game::paint::ColorFillPaintableFactory'->getInstance()->getInstance($self->{basicColorFactory}->{BLACK}, 1);
    $self->{baseGameStatistics} = 'org::allbinary::canvas::GameStatisticsFactory'->getInstance();
    $self->{primaryPlayerQueue} = 'org::allbinary::media::audio::PrimaryPlayerQueueFactory'->getInstance();
    $self->{secondaryPlayerQueue} = 'org::allbinary::media::audio::SecondaryPlayerQueueFactory'->getInstance();
    $self->{BUILD_GAME} = "buildGame";
    $self->{gameTypeFactory} = 'org::allbinary::game::GameTypeFactory'->getInstance();
    $self->{screenCapture} = 'org::allbinary::graphics::ScreenCaptureFactory'->getInstance();
    $self->{basicMotionGesturesHandler} = 'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance();
    $self->{gameKeyEventHandler} = 'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance();
    $self->{gameBehavior} = undef;
    $self->{menuBehavior} = undef;
    $self->{progressPaintable} = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getLazyInstance();
    $self->{fontHeightP} = 0;
    $self->{gameCanvasStartListener} = $org::allbinary::game::displayable::canvas::NullDemoPaintable::NULL_DEMO_PAINTABLE;
    $self->{rawGameInputProcessor} = 'org::allbinary::game::displayable::canvas::GameCanvasInputProcessor'->new($self);
    $self->{rawInputProcessor} = 'org::allbinary::game::displayable::canvas::FormInputProcessor'->new($self);
    $self->{inputProcessor} = $self->getRawGameInputProcessor();
    $self->{YIELD_SLEEP} = 100;
}


sub new {
    my ($class, $commandListener, $gameLayerManager, $highScoresFactoryInterface, $gameInitializationInterfaceFactoryInterface, $buffered) = @_;
    my $self = $class->SUPER::new($commandListener, 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{EMPTY_CHILD_NAME_LIST}, 1);
    $self->_init_fields();
        # super(...) made $self above
        $self->{highScoresHelper} = $highScoresFactoryInterface->createHighScoresHelper();
        $self->{gameInitializationInterfaceFactoryInterface} = $gameInitializationInterfaceFactoryInterface;
        $self->init($gameLayerManager, $buffered);
        $self->{highScoresFactoryInterface} = $highScoresFactoryInterface;
        if ($self->{gameLayerManager}->getGameInfo()->getGameType() == $self->{gameTypeFactory}->{BOT} || $self->{gameLayerManager}->getGameInfo()->getGameType() == $self->{gameTypeFactory}->{NONE}) {
            $self->{gameBehavior} = 'org::allbinary::game::displayable::canvas::DemoGameBehavior'->getInstance();
            $self->{menuBehavior} = 'org::allbinary::game::displayable::canvas::BaseMenuBehavior'->getInstance();
        } else {
            $self->{gameBehavior} = 'org::allbinary::game::displayable::canvas::BaseGameBehavior'->getInstance();
            $self->{menuBehavior} = $self->getInGameMenuBehavior();
        }
        $self->initPopupMenu();
        $self->initMenu();
        $self->initSpecialPaint();
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->addListenerInterface($self);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        try {
            my $font = $graphics->getFont();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->append($self->{canvasStrings}->{FD_WIDTH})->appendint(int('org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font)))->append($self->{canvasStrings}->{FD_HEIGHT})->appendint(int($font->getHeight()))->toString(), $self, $self->{canvasStrings}->{UPDATE_MEASUREMENT});
            $self->{fontHeightP} = $font->getHeight();
            $self->{myFormUtil}->updateMeasurement($graphics);
            my $popupMenuRectangle = $self->{myFormUtil}->getPopupMenuRectangle();
            my $basicPopupMenuPaintable = ($self->getOpenMenuPaintable());
            $basicPopupMenuPaintable->init($popupMenuRectangle);
            if ($self->getPopupMenuInputProcessor() != 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->getInstance()) {
                my $popupMenuInputProcessor = ($self->getPopupMenuInputProcessor());
                $popupMenuInputProcessor->init($popupMenuRectangle);
            }
            $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT}, $e);
        }
}


sub getInGameMenuBehavior {
    my ($self) = @_;
        return 'org::allbinary::game::displayable::canvas::InGameMenuBehavior'->getInstance();
}


sub setCurrentThread {
    my ($self) = @_;
        if ('org::allbinary::J2MEUtil'->isHTML()) {
            $self->SUPER::setCurrentThreadFake();
        } else {
            $self->SUPER::setCurrentThread();
        }
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->append('org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->toString())->toString(), $self, $self->{canvasStrings}->{UPDATE_MEASUREMENT});
            $self->{myFontProcessor} = $self->{updateMyFontProcessor};
            $self->{menuBehavior}->onDisplayChangeEvent($self, $displayChangeEvent);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT}, $e);
        }
}


# throws Exception
sub updateMenuFromEvent {
    my ($self, $displayChangeEvent) = @_;
        my $formType = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->getFormType();
        my $rectangle = $self->{formUtil}->createFormRectangle();
        $self->{menuForm}->init($rectangle, $formType);
        if ($self->{currentTouchInputFactory} != 'org::allbinary::input::motion::button::NoButtonsTouchInputFactory'->getInstance()) {
            $self->{touchButtonFactory}->toggle($self->isPaused(), $self->{currentTouchInputFactory}->getList());
        }
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


# throws Exception
sub processSleep {
    my ($self) = @_;
        $self->SUPER::processSleep();
        if ('org::allbinary::media::audio::AllBinaryMediaManager'->update()) {
            if (!$self->{primaryPlayerQueue}->process()) {
                $self->{secondaryPlayerQueue}->process();
            }
        }
        if ($self->{menuInputProcessor}->processInputList() != -1) {
            $self->{runnableCanvasRefreshHelper}->process();
        }
}


# throws Exception
sub initPopupMenu {
    my ($self) = @_;
        if ($self->{popupMenuInputProcessor} == 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->getInstance()) {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $popupMenuRectangle = $self->{myFormUtil}->getPopupMenuRectangle();
            if ($features->isFeature($self->{touchFeatureFactory}->{TOUCH_ENABLED})) {
                $self->setOpenMenuPaintable('org::allbinary::game::displayable::canvas::BasicPopupMenuPaintable'->new($popupMenuRectangle, $self->{gameLayerManager}->getBackgroundBasicColor(), $self->{gameLayerManager}->getForegroundBasicColor()));
                $self->setPopupMenuInputProcessor('org::allbinary::game::displayable::canvas::PopupMenuInputProcessor'->new('org::allbinary::util::BasicArrayListD'->new(), -1, $self, $popupMenuRectangle));
            }
        } else {
        }
}


sub initMenu {
    my ($self) = @_;
        try {
            $self->{menuBehavior}->initMenu($self);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "initMenu", $e);
        }
}


# throws Exception
sub initMenu2 {
    my ($self) = @_;
        $self->closeMenu();
        my $formType = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->getFormType();
        my $gameLimitedCommandTextItemArrayFactory = 'org::allbinary::game::displayable::canvas::GameLimitedCommandTextItemArrayFactory'->getInstance();
        my $commandTextItemArrayFactory = $gameLimitedCommandTextItemArrayFactory->getCommandTextItemArrayFactory();
        my $items = $commandTextItemArrayFactory->getInstance($self->getCommandStack(), $self->{gameLayerManager}->getBackgroundBasicColor(), $self->{gameLayerManager}->getForegroundBasicColor());
        my $rectangle = $self->{formUtil}->createFormRectangle();
        $self->setMenuForm('org::allbinary::graphics::form::CommandCurrentSelectionFormFactory'->getInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $items, $rectangle, $formType, 25, 0, $self->{gameLayerManager}->getBackgroundBasicColor(), $self->{gameLayerManager}->getForegroundBasicColor()));
        my $scrollSelectionForm = $self->getMenuForm();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($self->{touchFeatureFactory}->{TOUCH_ENABLED})) {
            $self->{mainMenuInputProcessor} = 'org::allbinary::game::displayable::canvas::PopupCommandFormInputProcessor'->new('org::allbinary::util::BasicArrayListD'->new(), -1, $self, $scrollSelectionForm, $self->getPopupMenuInputProcessor());
        } else {
        }
        $self->setMenuInputProcessor($self->getPopupMenuInputProcessor());
        if ($scrollSelectionForm != 'org::allbinary::graphics::form::ScrollSelectionFormNoneFactory'->getInstance()) {
            $self->setFormPaintable('org::allbinary::graphics::form::FormPaintable'->new($scrollSelectionForm));
        } else {
        }
        $self->closeMenu();
}


sub updateMenu {
    my ($self) = @_;
        try {
            $self->{menuBehavior}->updateMenu($self);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "initMenu", $e);
        }
}


# throws Exception
sub updateMenu2 {
    my ($self) = @_;
        my $scrollSelectionForm = $self->getMenuForm();
        $scrollSelectionForm->deleteAll();
        my $gameLimitedCommandTextItemArrayFactory = 'org::allbinary::game::displayable::canvas::GameLimitedCommandTextItemArrayFactory'->getInstance();
        my $commandTextItemArrayFactory = $gameLimitedCommandTextItemArrayFactory->getCommandTextItemArrayFactory();
        my $items = $commandTextItemArrayFactory->getInstance($self->getCommandStack(), $self->{gameLayerManager}->getBackgroundBasicColor(), $self->{gameLayerManager}->getForegroundBasicColor());
        my $size = scalar(@{$items});
        for (my $index = 0; $index < $size; $index++) {
            $scrollSelectionForm->append($items->[$index]);
        }
        my $formType = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->getFormType();
        my $rectangle = $self->{formUtil}->createFormRectangle();
        $scrollSelectionForm->init($rectangle, $formType);
}


sub pause {
    my ($self) = @_;
        $self->{gameBehavior}->pause($self);
        $self->closeMenu();
        $self->SUPER::pause();
        $self->{touchButtonFactory}->toggle($self->isPaused(), 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance());
        $self->{tsUtil}->gc();
}


sub unPause {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{gameStrings}->{UNPAUSE});
        $self->closeMenu();
        $self->{tsUtil}->gc();
        $self->SUPER::unPause();
        $self->{touchButtonFactory}->toggle($self->isPaused(), 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance());
        $self->{gameBehavior}->unPause($self);
}


sub isPausable {
    my ($self) = @_;
        if ('org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance()->getUsedRunnable() == 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance()) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub popupMenu {
    my ($self) = @_;
        $self->{menuBehavior}->popupMenu($self);
}


# throws Exception
sub popupMenu2 {
    my ($self) = @_;
        $self->{primaryPlayerQueue}->add('org::allbinary::media::audio::SelectSound'->getInstance());
        $self->setMenuPaintable($self->getFormPaintable());
        $self->setMenuInputProcessor($self->{mainMenuInputProcessor});
        $self->{basicMotionGesturesHandler}->addListenerInterface($self->{mainMenuInputProcessor});
        $self->{gameKeyEventHandler}->addListener($self->{mainMenuInputProcessor});
}


# throws Exception
sub toggleMenu {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{gameStrings}->{TOGGLE_MENU});
        if ($self->getMenuPaintable() == $self->getOpenMenuPaintable()) {
            $self->pause();
            $self->updateMenu();
            $self->popupMenu();
        } elsif ($self->getMenuPaintable() == $self->getFormPaintable()) {
            $self->{primaryPlayerQueue}->add('org::allbinary::media::audio::SelectSound'->getInstance());
            $self->unPause();
        }
}


sub closeMenu {
    my ($self) = @_;
        $self->{menuBehavior}->closeMenu($self);
}


sub closeMenu2 {
    my ($self) = @_;
        $self->setMenuPaintable($self->getOpenMenuPaintable());
        $self->{basicMotionGesturesHandler}->removeListener($self->{mainMenuInputProcessor});
        $self->{gameKeyEventHandler}->removeListener($self->{mainMenuInputProcessor});
        $self->setMenuInputProcessor($self->getPopupMenuInputProcessor());
}


sub open {
    my ($self) = @_;
        $self->{basicMotionGesturesHandler}->addListenerInterface($self->{menuInputProcessor});
        $self->{gameKeyEventHandler}->addListener($self->{menuInputProcessor});
}


sub close {
    my ($self) = @_;
        $self->{basicMotionGesturesHandler}->removeListener($self->{menuInputProcessor});
        $self->{gameKeyEventHandler}->removeListener($self->{menuInputProcessor});
        $self->{primaryPlayerQueue}->clear();
        $self->{secondaryPlayerQueue}->clear();
}


# throws Exception
sub processorInit {
    my ($self) = @_;
        $self->setMainStateProcessor('org::allbinary::canvas::Processor'->getInstance());
        $self->setProcessGameProcessorInit();
}


sub setProcessGameProcessorInit {
    my ($self) = @_;
        $self->setProcessGameProcessor('org::allbinary::game::displayable::canvas::GameProcessor'->new($self));
}


sub initSpecialPaint {
    my ($self) = @_;
        $self->{menuBehavior}->initSpecialPaint($self);
}


# throws Exception
sub init {
    my ($self, $gameLayerManager, $buffered) = @_;
        $self->{gameStateTimeHelper}->setStartTimeTNT();
        $self->setHighScoreSubmitted(0);
        $self->setLayerManager($gameLayerManager);
        if (!$buffered) {
            my $BUFF_MESSAGE = "XXX Not Buffering Causes Concurrency Issues XXX";
            $self->{logUtil}->putF($BUFF_MESSAGE, $self, $self->{commonStrings}->{CONSTRUCTOR});
        } else {
            die ("Buffering is disabled");
        }
        $self->setGameInputProcessor('org::allbinary::canvas::Processor'->getInstance());
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{CHEATING})) {
            $self->{isCheating} = 1;
            $self->{cheatProcessor} = 'org::allbinary::game::displayable::canvas::CheatGameInputProcessor'->new($self);
            $self->{gameKeyEventHandler}->addListener($self->{cheatProcessor});
        } else {
            $self->{isCheating} = 0;
            $self->{cheatProcessor} = 'org::allbinary::game::input::NoPlayerGameInput'->getInstance();
        }
        $self->{realEndGameProcessor} = 'org::allbinary::game::displayable::canvas::EndGameProcessor'->new($self);
        $self->setEndGameProcessor('org::allbinary::canvas::Processor'->getInstance());
        $self->{realStartIntermissionProcessor} = 'org::allbinary::game::displayable::canvas::StartIntermissionProcessor'->new($self);
        $self->{startIntermissionProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
        $self->setEndGameStatePaintable('org::allbinary::game::displayable::canvas::EndGamePaintable'->new($self));
        $self->setEndGamePaintable('org::allbinary::graphics::paint::NullPaintable'->getInstance());
        $self->setIntermissionPaintable('org::allbinary::graphics::paint::NullPaintable'->getInstance());
        $self->getStartIntermissionInterface()->setListener($self);
}


sub notifyIntermission {
    my ($self, $enable) = @_;
        if ($enable) {
            $self->{startIntermissionProcessor} = $self->{realStartIntermissionProcessor};
        } else {
            $self->{startIntermissionProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
        }
        if ($enable) {
            $self->setIntermissionPaintable($self->getStartIntermissionPaintable());
        } else {
            $self->setIntermissionPaintable('org::allbinary::graphics::paint::NullPaintable'->getInstance());
        }
}


# throws Exception
sub mediaInit {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
}


# throws Exception
sub initConfigurable {
    my ($self, $abeClientInformation) = @_;
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->addNormalPortion(50, "Setting Configurables");
        'org::allbinary::game::init::GameInitializationUtil'->getInstance()->initGame($abeClientInformation, $self, $self->{gameInitializationInterfaceFactoryInterface});
        my $gameFeatureFactory = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
        my $changedGameFeatureListener = 'org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance();
        if ($changedGameFeatureListener->isChangedFeature($gameFeatureFactory->{SOUND})) {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Sound Changing To: ")->appendboolean($features->isFeature($gameFeatureFactory->{SOUND}))->toString(), $self, "initConfigurable");
            $self->mediaInit();
            $changedGameFeatureListener->remove($gameFeatureFactory->{SOUND});
        }
        my $sensorFeatureFactory = 'org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance();
        if ($changedGameFeatureListener->isChangedFeature($sensorFeatureFactory->{ORIENTATION_SENSORS}) || $changedGameFeatureListener->isChangedFeature($sensorFeatureFactory->{NO_ORIENTATION}) || $changedGameFeatureListener->isChangedFeature($sensorFeatureFactory->{SIMULATED_ORIENTATION_SENSORS})) {
            $changedGameFeatureListener->remove($sensorFeatureFactory->{NO_ORIENTATION});
            $changedGameFeatureListener->remove($sensorFeatureFactory->{ORIENTATION_SENSORS});
            $changedGameFeatureListener->remove($sensorFeatureFactory->{SIMULATED_ORIENTATION_SENSORS});
        }
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        $self->loadResourceLoadingLevel($resourceLoadingLevelFactory->{LOAD_GAME});
}


# throws Exception
sub initApp {
    my ($self, $abeClientInformation) = @_;
        $self->initConfigurable($abeClientInformation);
        $self->processorInit();
        $self->{sensorGameUpdateProcessor}->process($self->{gameLayerManager});
        $self->{sensorGameUpdateProcessor}->sendNotifications($self->{gameLayerManager});
        $self->initTouch();
}


# throws Exception
sub initTouch {
    my ($self) = @_;
        my $gameInitializedEvent = 'org::allbinary::game::init::GameInitializationUtil'->getInstance()->{EVENT};
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        $gameInitializedEvent->setResourceLoadingLevel($resourceLoadingLevelFactory->{LOAD_TOUCH});
        'org::allbinary::game::configuration::event::GameInitializedEventHandler'->getInstance()->fireEvent($gameInitializedEvent);
        $self->{touchButtonFactory}->defaultList();
        $self->updateTouch();
        $self->postInitTouch();
}


# throws Exception
sub updateCurrentTouchInputFactory {
    my ($self, $nextTouchInput) = @_;
        if ($nextTouchInput != $self->{currentTouchInputFactory}) {
            $self->{currentTouchInputFactory} = $nextTouchInput;
            'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{currentTouchInputFactory}->toString(), $self, $self->{gameInputStrings}->{UDPATE_CURRENT_TOUCH_INPUT_FACTORY});
            $self->{touchButtonFactory}->toggle($self->isPaused(), $self->{currentTouchInputFactory}->getList());
        }
}


# throws Exception
sub updateTouch {
    my ($self) = @_;
        $self->{gameBehavior}->updateTouch($self);
}


# throws Exception
sub updateTouch2 {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($self->{touchFeatureFactory}->{AUTO_HIDE_SHOW_SCREEN_BUTTONS})) {
            if ($self->{gameLayerManager}->getGameInfo()->getCurrentLevel() - $self->getStartLevel() == 1) {
                $self->setTouchPaintableP('org::allbinary::graphics::paint::NullPaintable'->getInstance());
            }
        }
}


# throws Exception
sub postInitTouch {
    my ($self) = @_;
        $self->setTouchButtonsPaintable('org::allbinary::input::motion::button::TouchButtonsPaintableFactory'->getInstance($self->{gameLayerManager}->getForegroundBasicColor()));
        $self->updateScreenButtonPaintable();
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->addCommands();
        $self->setCommandListener($cmdListener);
}


sub addCommands {
    my ($self) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        my $myCommandsFactory = 'org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance();
        if ('org::allbinary::debug::DebugFactory'->getInstance() != 'org::allbinary::debug::NoDebug'->getInstance()) {
            $self->addCommand($gameCommandsFactory->{START_TRACE});
        }
        $self->addCommand($gameCommandsFactory->{RESTART_COMMAND});
        $self->addCommand($myCommandsFactory->{PAUSE_COMMAND});
        $self->addCommand($gameCommandsFactory->{QUIT_COMMAND});
        my $isOverScan = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance()->isOverScan();
        if ('org::allbinary::J2MEUtil'->isHTML()) {
        } elsif ($org::allbinary::game::layer::SWTUtil::isSWT) {
        } elsif (!$isOverScan) {
            if ('org::allbinary::input::motion::button::TouchScreenFactory'->getInstance()->isTouch() && 'org::allbinary::game::configuration::InGameFeatures'->new()->isAny()) {
                $self->addCommand($org::allbinary::game::configuration::InGameOptionsForm::DISPLAY);
            }
            $self->addCommand($gameCommandsFactory->{SAVE});
            $self->addCommand($gameCommandsFactory->{DISPLAY_LOAD_FORM});
        }
}


sub itemStateChanged {
    my ($self, $item) = @_;
        try {
            my $itemLabel = $item->getLabel();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonLabels}->{ITEM_LABEL})->append($itemLabel)->toString(), $self, "itemStateChanged");
            if ((Scalar::Util::blessed($item) && $item->isa('javax::microedition::lcdui::ChoiceGroup'))) {
                my $gameFeatureUtil = 'org::allbinary::game::configuration::feature::GameFeatureUtil'->getInstance();
                if ($gameFeatureUtil->isExclusive($itemLabel)) {
                    $gameFeatureUtil->updateExclusiveForChoiceGroup($item);
                } else {
                    $gameFeatureUtil->updateMultiple($item);
                }
            }
            $self->{sensorGameUpdateProcessor}->process($self->{gameLayerManager});
            $self->updateTouch();
            $self->updateScreenButtonPaintable();
            $self->{sensorGameUpdateProcessor}->sendNotifications($self->{gameLayerManager});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "itemStateChanged", $e);
        }
}


# throws Exception
sub updateScreenButtonPaintable {
    my ($self) = @_;
        $self->{gameBehavior}->updateScreenButtonPaintable($self);
}


sub updateScreenButtonPaintable2 {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($self->{touchFeatureFactory}->{AUTO_HIDE_SHOW_SCREEN_BUTTONS})) {
            $self->setTouchPaintableP($self->getTouchButtonsPaintable());
            $self->setStartLevel($self->{gameLayerManager}->getGameInfo()->getCurrentLevel());
        } elsif ($features->isFeature($self->{touchFeatureFactory}->{SHOW_SCREEN_BUTTONS})) {
            $self->setTouchPaintableP($self->getTouchButtonsPaintable());
        } elsif ($features->isFeature($self->{touchFeatureFactory}->{HIDE_SCREEN_BUTTONS})) {
            $self->setTouchPaintableP('org::allbinary::graphics::paint::NullPaintable'->getInstance());
        } else {
            $self->setTouchPaintableP('org::allbinary::graphics::paint::NullPaintable'->getInstance());
        }
}


sub getLayerManager {
    my ($self) = @_;
        return $self->{gameLayerManager};
}


sub setLayerManager {
    my ($self, $layerManager) = @_;
        $self->{gameLayerManager} = $layerManager;
}


sub isGameOver {
    my ($self) = @_;
        return $self->{gameOver};
}


sub setGameOver {
    my ($self, $gameOver) = @_;
        $self->{gameOver} = $gameOver;
}


# throws Exception
sub processGameOver {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{commonStrings}->{START}, $self, $self->{gameStrings}->{SET_GAME_OVER});
        $self->setGameOver(1);
        $self->removePauseCommand();
        $self->setGameState($self->{gameStateFactory}->{SHOW_END_RESULT_GAME_STATE});
        $self->setEndGamePaintable($self->getEndGameStatePaintable());
}


sub isHighScoreSubmitted {
    my ($self) = @_;
        return $self->{highScoreSubmitted};
}


# throws Exception
sub setHighScoreSubmitted {
    my ($self, $highScoreSubmitted) = @_;
        $self->{highScoreSubmitted} = $highScoreSubmitted;
        if ($highScoreSubmitted) {
            $self->{highScoresHelper}->setSelectedHighScores('org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance());
        }
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("isHighScoreSubmitted: ")->appendboolean($highScoreSubmitted)->toString(), $self, "setHighScoreSubmitted");
}


sub getGameState {
    my ($self) = @_;
        return $self->{gameState};
}


# throws Exception
sub setGameState {
    my ($self, $gameState) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameStrings}->{GAME_STATE})->append($self->{stringUtil}->toString($gameState))->toString(), $self, $self->{gameStrings}->{SET_GAME_STATE});
        $self->{gameState} = $gameState;
        $self->{gameStateTimeHelper}->setStartTimeTNT();
        $self->updateEndGameProcessor();
        $self->updateGameKeyEventProcessor();
        $self->{gameBehavior}->setGameState($self);
}


# throws Exception
sub updateGameState {
    my ($self) = @_;
        my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
        $gameAdState->processAdState($self->{gameState}, $self->{gameLayerManager}->getGameInfo()->getGameType());
        if ($self->{gameState} != $self->{gameStateFactory}->{PLAYING_GAME_STATE}) {
            $gameAdState->processPageAdState();
        }
}


sub updateGameKeyEventProcessor {
    my ($self) = @_;
        if ($self->getGameState() != $self->{gameStateFactory}->{PLAYING_GAME_STATE} || $self->{isCheating}) {
        } else {
        }
}


sub removeAllGameKeyInputListenersOnBuild {
    my ($self) = @_;
        $self->removeAllGameKeyInputListeners();
}


sub removeAllGameKeyInputListeners {
    my ($self) = @_;
        $self->{gameBehavior}->removeAllGameKeyInputListeners($self);
}


sub removeAllGameKeyInputListeners2 {
    my ($self) = @_;
        $self->{logUtil}->putF("Remove PlayerInput Listeners", $self, "removeAllGameKeyInputListeners");
        for (my $index = $self->{localPlayerGameInputList}->size() - 1; $index >= 0; $index--) {
            my $playerGameInput = $self->{localPlayerGameInputList}->get($index);
            $self->removeKeyInputListener($playerGameInput);
            $playerGameInput->removeNonAIInputGameKeyEvents();
        }
}


sub removeKeyInputListener {
    my ($self, $playerGameInput) = @_;
        $self->{gameKeyEventHandler}->removeListener($playerGameInput);
}


# throws Exception
sub updateEndGameProcessor {
    my ($self) = @_;
        $self->{gameBehavior}->updateEndGameProcessor($self);
}


# throws Exception
sub updateEndGameProcessor2 {
    my ($self) = @_;
        if ($self->getGameState() == $self->{gameStateFactory}->{SHOW_END_RESULT_GAME_STATE} || $self->getGameState() == $self->{gameStateFactory}->{SHOW_HIGH_SCORE_GAME_STATE}) {
            $self->setEndGameProcessor($self->{realEndGameProcessor});
        } else {
            $self->setEndGameProcessor('org::allbinary::canvas::Processor'->getInstance());
        }
}


# throws Exception
sub buildGameInit {
    my ($self, $isPortion) = @_;
}


# throws Exception
sub cleanupGame {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CLEANUP});
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->addNormalPortion(10, "Cleaning Up");
        $self->{primaryPlayerQueue}->clear();
        $self->{secondaryPlayerQueue}->clear();
        'org::allbinary::game::displayable::GameLevelDisplayChangeEventListenersFactory'->getInstance()->clear();
}


# throws Exception
sub loadResourceLoadingLevel {
    my ($self, $resourceLoadingLevel) = @_;
        my $gameInitializedEvent = 'org::allbinary::game::init::GameInitializationUtil'->getInstance()->{EVENT};
        $gameInitializedEvent->setResourceLoadingLevel($resourceLoadingLevel);
        'org::allbinary::game::configuration::event::GameInitializedEventHandler'->getInstance()->fireEvent($gameInitializedEvent);
}


# throws Exception
sub loadResources {
    my ($self, $level) = @_;
        my $gameInitializedEvent = 'org::allbinary::game::init::GameInitializationUtil'->getInstance()->{EVENT};
        $gameInitializedEvent->setLevel($level);
        'org::allbinary::game::configuration::event::GameInitializedEventHandler'->getInstance()->fireEvent($gameInitializedEvent);
}


# throws Exception
sub updateColor {
    my ($self) = @_;
}


# throws Exception
sub buildGame {
    my ($self, $portion) = @_;
        $self->{screenCapture}->endRecording();
        $self->{screenCapture}->startRecording();
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        $progressCanvas->addNormalPortion($portion, "Generic Build");
        $self->removeAllGameKeyInputListenersOnBuild();
        $self->updateTouch();
        $progressCanvas->addNormalPortion($portion, "High Scores");
        $self->{highScoresFactoryInterface}->fetchHighScores($self->{gameLayerManager}->getGameInfo(), $self->{highScoresHelper});
        $self->setHighScoresPaintable('org::allbinary::graphics::paint::NullPaintable'->getInstance());
        $progressCanvas->addNormalPortion($portion, "Finishing.");
        $self->getEndGameInfoP()->update($self->getLayerManager()->getGameInfo(), $self);
        $self->{isSingleKeyRepeatableProcessing} = $features->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_REPEAT_PRESS});
        $self->setGameOver(0);
        $progressCanvas->addNormalPortion($portion, "Finishing..");
        $self->updateColor();
        $self->getStartIntermissionPaintable()->update();
        if (!$self->isRunningInAnotherThread()) {
            return;
        }
        $progressCanvas->addNormalPortion($portion, "Finishing...");
        if ($self->isMainCanvas() || !$self->isInitialized()) {
            if ($features->isFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{LOAD_ONDEMAND})) {
                if (defined($self->getCustomCommandListener())) {
                    $progressCanvas->end();
                }
            } else {
                $progressCanvas->end();
            }
            $self->setInitialized(1);
        }
        if ($self->getCustomCommandListener() == $javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER) {
            $self->{logUtil}->putF("Show Game Paintable in DemoCanvas Thread", $self, $self->{BUILD_GAME});
            $self->{gameCanvasStartListener}->showGamePaintable();
        } else {
            $self->{logUtil}->putF("No GameCanvasStartListener", $self, $self->{BUILD_GAME});
        }
        $self->{colorFillPaintable}->setBasicColorP($self->{gameLayerManager}->getBackgroundBasicColor());
        $self->{gameBehavior}->buildGame($self);
}


sub buildGame2 {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{ENABLE_PLAYER_GAME_INPUTS})->appendint($self->{localPlayerGameInputList}->size())->toString(), $self, $self->{BUILD_GAME});
        my $playerGameInput = undef;
        for (my $index = $self->{localPlayerGameInputList}->size() - 1; $index >= 0; $index--) {
            $playerGameInput = $self->{localPlayerGameInputList}->get($index);
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{ENABLE_PLAYER_GAME_INPUT})->append($playerGameInput->toString())->toString(), $self, $self->{BUILD_GAME});
            $playerGameInput->removeNonAIInputGameKeyEvents();
            $self->addKeyInputListener($playerGameInput);
        }
}


sub addKeyInputListener {
    my ($self, $playerGameInput) = @_;
        'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->addListenerForPlayer($playerGameInput, $playerGameInput->getPlayerInputId());
}


sub setGameCanvasStartListener {
    my ($self, $gameCanvasStartListener) = @_;
        $self->{gameCanvasStartListener} = $gameCanvasStartListener;
}


# throws Exception
sub loadState {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{LOAD});
        my $hashtable = $self->getLoadStateHashtable();
        if (defined($hashtable) && $hashtable->size() > 0) {
            my $levelAsString = $hashtable->get($org::allbinary::game::GameInfo::LEVEL_NAME);
            my $level = int(("" . ($levelAsString)));
            my $gameInfo = $self->{gameLayerManager}->getGameInfo();
            $gameInfo->setCurrentLevel($level);
        }
}


# throws Exception
sub getLoadStateHashtable {
    my ($self) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonLabels}->{START_LABEL})->append($self->{stringUtil}->toString($self->{hashtable}))->toString(), $self, "getLoadStateHashtable");
        return $self->{hashtable};
}


sub setLoadStateHashtable {
    my ($self, $hashtable) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonLabels}->{START_LABEL})->append($self->{stringUtil}->toString($hashtable))->toString(), $self, "setLoadStateHashtable");
        $self->{hashtable} = $hashtable;
}


sub getCurrentStateHashtable {
    my ($self) = @_;
        my $hashtable = $self->{stdUtil}->createHashtable();
        my $level = $self->{gameLayerManager}->getGameInfo()->getCurrentLevel();
        $hashtable->put($org::allbinary::game::GameInfo::LEVEL_NAME->toString(), ("" . ($level)));
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("End: ")->append($self->{stringUtil}->toString($hashtable))->toString(), $self, "getCurrentStateHashtable");
        return $hashtable;
}


sub paintGameOver {
    my ($self, $graphics) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
}


sub draw {
    my ($self, $graphics) = @_;
        $self->{colorFillPaintable}->paint($graphics);
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{gameLayerManager}->getForegroundBasicColor());
        $self->{gameSpecificPaintable}->paint($graphics);
}


sub clear {
    my ($self, $graphics) = @_;
        $self->{colorFillPaintable}->paint($graphics);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{baseGameStatistics}->nextRefresh();
        $self->draw($graphics);
        $self->{menuPaintable}->paint($graphics);
        $self->{progressPaintable}->paint($graphics);
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


# throws Exception
sub processEndLevelIntermissionGameState {
    my ($self) = @_;
}


sub nonBotPaint {
    my ($self, $graphics) = @_;
        $self->{endGamePaintable}->paint($graphics);
        $self->{intermissionPaintable}->paint($graphics);
        $self->paintIntermission($graphics);
        $self->{touchPaintable}->paint($graphics);
}


sub paintIntermission {
    my ($self, $graphics) = @_;
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
        $self->{inputProcessor}->keyPressedByDevice($keyCode, $deviceId);
}


sub keyRepeatedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        if ($self->{isSingleKeyRepeatableProcessing}) {
            $self->{inputProcessor}->keyPressedByDevice($keyCode, $deviceId);
        }
}


sub keyReleasedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        $self->{inputProcessor}->keyReleasedByDevice($self, $keyCode, $deviceId);
}


# throws Exception
sub handleRawKey {
    my ($self, $keyCode, $deviceId, $repeated) = @_;
}


sub endProgress {
    my ($self, $isProgress) = @_;
        my $portion = 30;
        if ($isProgress && $self->isMainCanvas()) {
            my $myCommandsFactory = 'org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance();
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            $progressCanvas->start();
            $self->getCustomCommandListener()->commandAction($myCommandsFactory->{SET_DISPLAYABLE}, $progressCanvas);
            $portion = 4;
        }
        return $portion;
}


# throws Exception
sub processPlayingGame {
    my ($self) = @_;
        $self->{cheatProcessor}->update();
        $self->{sensorGameUpdateProcessor}->getInputSensor()->update();
        $self->{gameInputProcessor}->process();
        $self->{gameLayerManager}->process();
        $self->{startIntermissionProcessor}->process();
}


# throws Exception
sub threadInit {
    my ($self) = @_;
}


# throws Exception
sub processGame {
    my ($self) = @_;
        $self->SUPER::process();
        if ('org::allbinary::media::audio::AllBinaryMediaManager'->update()) {
            if (!$self->{primaryPlayerQueue}->process()) {
                $self->{secondaryPlayerQueue}->process();
            }
        }
        $self->{mainStateProcessor}->process();
        $self->{menuInputProcessor}->processInputList();
        $self->{endGameProcessor}->process();
        $self->{baseGameStatistics}->nextFrame();
}


sub notifyDonePainting {
    my ($self) = @_;
        { # synchronized ($self)
            $self->{threadObjectUtil}->notifyObject($self);
        }
}


# throws Exception
sub shouldWait {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ('org::allbinary::AndroidUtil'->isAndroid()) {
        } elsif ($features->isFeature($self->{openGLFeatureFactory}->{OPENGL_2D})) {
        } else {
            if ($features->isDefault($self->{openGLFeatureFactory}->{OPENGL})) {
                my $openGLImageSpecificFactory = 'org::allbinary::image::opengles::OpenGLImageSpecificFactory'->getInstance();
                while ($openGLImageSpecificFactory->{updating}) {
                    Time::HiRes::sleep(($self->{YIELD_SLEEP}) / 1000);
                }
            }
        }
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            $progressCanvas->addNormalPortion(50, "Game Thread");
            $self->setCurrentThread();
            $self->setRunning(1);
            if ($self->getCustomCommandListener() == $javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER) {
                Time::HiRes::sleep(($self->{YIELD_SLEEP}) / 1000);
            }
            $self->shouldWait();
            $self->threadInit();
            if ($self->getCustomCommandListener() == $javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER) {
                Time::HiRes::sleep(($self->{YIELD_SLEEP}) / 1000);
            }
            $self->open();
            my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
            $gameAdState->init();
            $gameAdState->setGameIsReady(1);
            $self->{gameBehavior}->run($self);
            $self->{logUtil}->putF($self->{commonStrings}->{END_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}


# throws Exception
sub run2 {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isDefault($self->{openGLFeatureFactory}->{OPENGL_AS_GAME_THREAD}) || 'org::allbinary::J2MEUtil'->isHTML()) {
            if ($features->isDefault($self->{openGLFeatureFactory}->{OPENGL_AS_GAME_THREAD})) {
                $self->{logUtil}->putF($self->{openGLFeatureFactory}->{OPENGL_AS_GAME_THREAD}->getName(), $self, $self->{commonStrings}->{RUN});
            }
            if ('org::allbinary::J2MEUtil'->isHTML()) {
                $self->{logUtil}->putF('org::allbinary::graphics::GraphicsStrings'->getInstance()->{HTML}, $self, $self->{commonStrings}->{RUN});
            }
            my $currentDisplayableFactory = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance();
            $currentDisplayableFactory->setRunnable($self->{gameRunnable});
            $currentDisplayableFactory->setDisplayable($self);
            'org::allbinary::graphics::opengles::OpenGLThreadUtil'->getInstance()->onResume();
        } elsif ($features->isDefault($self->{openGLFeatureFactory}->{OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS})) {
            $self->{logUtil}->putF($self->{openGLFeatureFactory}->{OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS}->getName(), $self, $self->{commonStrings}->{RUN});
            'org::allbinary::graphics::opengles::OpenGLThreadUtil'->getInstance()->onResume();
            while ($self->isRunning()) {
                $self->run3();
            }
            $self->end();
        } else {
            $self->{logUtil}->putF("this thread", $self, $self->{commonStrings}->{RUN});
            while ($self->isRunning()) {
                $self->run3();
            }
            $self->end();
        }
}


# throws Exception
sub run3 {
    my ($self) = @_;
        $self->{loopTimeHelper}->setStartTime($self->{gameTickTimeDelayHelper}->setStartTime());
        $self->{gameTickDisplayInfoSingleton}->update();
        $self->processGame();
        $self->processLoopSleep();
}


sub setRunning {
    my ($self, $running) = @_;
        $self->SUPER::setRunning($running);
        try {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            if ($running) {
            } else {
                if ($features->isDefault($self->{openGLFeatureFactory}->{OPENGL}) || $org::allbinary::game::layer::SWTUtil::isSWT) {
                    if ($self->{gameLayerManager}->getGameInfo()->getGameType() != $self->{gameTypeFactory}->{BOT}) {
                        my $currentDisplayableFactory = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->getInstance();
                        $currentDisplayableFactory->clearRunnable();
                    }
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
        $self->{screenCapture}->endRecording();
        $self->{baseGameStatistics}->add('org::allbinary::logic::string::StringMaker'->new()->append($self->{baseGameStatistics}->toString())->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE})->toString());
        $self->{baseGameStatistics}->init();
        $self->{gameKeyEventHandler}->removeListener($self->{cheatProcessor});
        $self->close();
        $self->removeAllGameKeyInputListeners();
        $self->endGameThread();
}


# throws Exception
sub endGameThread {
    my ($self) = @_;
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->removeListener($self);
        'org::allbinary::game::displayable::GameLevelDisplayChangeEventListenersFactory'->getInstance()->clear();
        my $gameAdState = $self->{gameAdStateFactory}->getCurrentInstance();
        $gameAdState->notPlayingAdState();
}


sub createHighScore {
    my ($self, $score) = @_;
        my $gameInfo = $self->{gameLayerManager}->getGameInfo();
        return 'org::allbinary::game::score::HighScore'->new(0, "NONE", 'org::allbinary::game::GameInfo'->new($gameInfo->getGameType(), $gameInfo->getGameMode(), 'org::allbinary::game::PlayerTypesFactory'->getInstance()->{PLAYER_TYPE_ONE}, 0, 0), $score);
}


# throws Exception
sub setHighScore {
    my ($self, $abeClientInformation, $name, $score, $autoSubmit, $isLast) = @_;
        $self->{gameBehavior}->setHighScore($abeClientInformation, $self, $name, $score, $autoSubmit, $isLast);
}


# throws Exception
sub setHighScore2 {
    my ($self, $abeClientInformation, $name, $score, $autoSubmit, $isLast) = @_;
        my $highScore = $self->createHighScore($score);
        my $textBox = 'org::allbinary::game::score::displayable::HighScoreTextBox'->new($self->{highScoresFactoryInterface}, $self->{highScoresHelper}, $abeClientInformation, $self->{gameLayerManager}->getGameInfo(), $self->getCustomCommandListener(), $name, $highScore, $self->{gameLayerManager}->getBackgroundBasicColor(), $self->{gameLayerManager}->getForegroundBasicColor());
        if ($isLast) {
            $self->getCustomCommandListener()->commandAction('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{SET_MENU_DISPLAYABLE}, $textBox);
        }
        if ($autoSubmit) {
            {
            package org::allbinary::game::displayable::canvas::SaveHighScoreRunnable;
            use strict;
            use warnings;
            use feature 'try';
            no warnings 'experimental::try';
            use Time::HiRes ();
            use Scalar::Util ();
            

            sub _init_fields {
                my ($self) = @_;
                $self->{progressCanvas} = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            }

            sub new {
                my ($class) = @_;
                my $self = bless({}, $class);
                $self->_init_fields();
                return $self;
            }
            

            sub run {
                my ($self) = @_;
                    my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                    try {
                        if ($self->{isLast}) {
                            $self->{textBox}->submit();
                        } else {
                            $self->{textBox}->saveHighScore();
                        }
                    } catch ($e) {
                        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                        $logUtil->put($commonStrings->{EXCEPTION}, $self, "run", $e);
                        $self->{progressCanvas}->end();
                    }
            }
            }

            'org::allbinary::thread::SecondaryThreadPool'->getInstance()->runTask('org::allbinary::game::displayable::canvas::SaveHighScoreRunnable'->new());
        }
}


sub getGameStateTimeHelper {
    my ($self) = @_;
        return $self->{gameStateTimeHelper};
}


sub setInitialized {
    my ($self, $initialized) = @_;
        $self->{initialized} = $initialized;
}


sub isInitialized {
    my ($self) = @_;
        return $self->{initialized};
}


sub getSourceId {
    my ($self) = @_;
        return $org::allbinary::game::displayable::canvas::AllBinaryGameCanvas::id;
}


sub setProgressPaintable {
    my ($self, $paintable) = @_;
        $self->{progressPaintable} = $paintable;
}


sub getStartIntermissionInterface {
    my ($self) = @_;
        return $self->{startIntermissionInterface};
}


sub getEndLevelIntermissionInterface {
    my ($self) = @_;
        return $self->{endLevelIntermissionInterface};
}


sub setTouchPaintableP {
    my ($self, $paintable) = @_;
        $self->{touchPaintable} = $paintable;
}


sub getTouchPaintableP {
    my ($self) = @_;
        return $self->{touchPaintable};
}


sub setEndGamePaintable {
    my ($self, $endGamePaintable) = @_;
        $self->{endGamePaintable} = $endGamePaintable;
}


sub getEndGamePaintable {
    my ($self) = @_;
        return $self->{endGamePaintable};
}


sub setIntermissionPaintable {
    my ($self, $intermissionPaintable) = @_;
        $self->{intermissionPaintable} = $intermissionPaintable;
}


sub getIntermissionPaintable {
    my ($self) = @_;
        return $self->{intermissionPaintable};
}


sub getEndGameInfoP {
    my ($self) = @_;
        return $self->{endGameInfo};
}


sub setHighScoresPaintable {
    my ($self, $highScoresPaintable) = @_;
        $self->{highScoresPaintable} = $highScoresPaintable;
}


sub getHighScoresPaintable {
    my ($self) = @_;
        return $self->{highScoresPaintable};
}


sub getRealHighScoresPaintable {
    my ($self) = @_;
        return $self->{realHighScoresPaintable};
}


sub clearPlayerGameInputList {
    my ($self) = @_;
        my $playerGameInput = undef;
        for (my $index = $self->{localPlayerGameInputList}->size() - 1; $index >= 0; $index--) {
            $playerGameInput = $self->{localPlayerGameInputList}->get($index);
            $self->{gameKeyEventHandler}->removeListener($playerGameInput);
        }
        $self->{localPlayerGameInputList}->clear();
}


sub addPlayerGameInput {
    my ($self, $playerGameInput) = @_;
        $self->{localPlayerGameInputList}->add($playerGameInput);
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


sub getStartLevel {
    my ($self) = @_;
        return $self->{startLevel};
}


sub setStartLevel {
    my ($self, $startLevel) = @_;
        $self->{startLevel} = $startLevel;
}


sub setTouchButtonsPaintable {
    my ($self, $touchButtonsPaintable) = @_;
        $self->{touchButtonsPaintable} = $touchButtonsPaintable;
}


sub getTouchButtonsPaintable {
    my ($self) = @_;
        return $self->{touchButtonsPaintable};
}


sub setGameInputProcessor {
    my ($self, $gameInputProcessor) = @_;
        $self->{gameInputProcessor} = $gameInputProcessor;
}


sub getGameInputProcessor {
    my ($self) = @_;
        return $self->{gameInputProcessor};
}


sub setEndGameProcessor {
    my ($self, $endGameProcessor) = @_;
        $self->{endGameProcessor} = $endGameProcessor;
}


sub getEndGameProcessor {
    my ($self) = @_;
        return $self->{endGameProcessor};
}


sub setEndGameStatePaintable {
    my ($self, $endGameStatePaintable) = @_;
        $self->{endGameStatePaintable} = $endGameStatePaintable;
}


sub getEndGameStatePaintable {
    my ($self) = @_;
        return $self->{endGameStatePaintable};
}


sub setNonBotPaintableP {
    my ($self, $nonBotPaintable) = @_;
        $self->{nonBotPaintable} = $nonBotPaintable;
}


sub getNonBotPaintableP {
    my ($self) = @_;
        return $self->{nonBotPaintable};
}


sub setStartIntermissionPaintable {
    my ($self, $startIntermissionPaintable) = @_;
        $self->{startIntermissionPaintable} = $startIntermissionPaintable;
}


sub getStartIntermissionPaintable {
    my ($self) = @_;
        return $self->{startIntermissionPaintable};
}


sub setMainStateProcessor {
    my ($self, $mainStateProcessor) = @_;
        $self->{mainStateProcessor} = $mainStateProcessor;
}


sub getMainStateProcessor {
    my ($self) = @_;
        return $self->{mainStateProcessor};
}


sub setProcessGameProcessor {
    my ($self, $processGameProcessor) = @_;
        $self->{processGameProcessor} = $processGameProcessor;
}


sub getProcessGameProcessor {
    my ($self) = @_;
        return $self->{processGameProcessor};
}


sub setOpenMenuPaintable {
    my ($self, $openMenuPaintable) = @_;
        $self->{openMenuPaintable} = $openMenuPaintable;
}


sub getOpenMenuPaintable {
    my ($self) = @_;
        return $self->{openMenuPaintable};
}


sub setPopupMenuInputProcessor {
    my ($self, $popupMenuInputProcessor) = @_;
        $self->{popupMenuInputProcessor} = $popupMenuInputProcessor;
}


sub getPopupMenuInputProcessor {
    my ($self) = @_;
        return $self->{popupMenuInputProcessor};
}


sub getSensorGameUpdateProcessor {
    my ($self) = @_;
        return $self->{sensorGameUpdateProcessor};
}


sub getRawGameInputProcessor {
    my ($self) = @_;
        return $self->{rawGameInputProcessor};
}


sub getRawInputProcessor {
    my ($self) = @_;
        return $self->{rawInputProcessor};
}


sub setInputProcessor {
    my ($self, $inputProcessor) = @_;
        $self->{inputProcessor} = $inputProcessor;
}


sub getInputProcessor {
    my ($self) = @_;
        return $self->{inputProcessor};
}


sub setMenuPaintable {
    my ($self, $menuPaintable) = @_;
        $self->{menuPaintable} = $menuPaintable;
}


sub getMenuPaintable {
    my ($self) = @_;
        return $self->{menuPaintable};
}


sub setFormPaintable {
    my ($self, $formPaintable) = @_;
        $self->{formPaintable} = $formPaintable;
}


sub getFormPaintable {
    my ($self) = @_;
        return $self->{formPaintable};
}


sub setGameSpecificPaintableP {
    my ($self, $gameSpecificPaintable) = @_;
        $self->{gameSpecificPaintable} = $gameSpecificPaintable;
}


sub getGameSpecificPaintableP {
    my ($self) = @_;
        return $self->{gameSpecificPaintable};
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


sub getType {
    my ($self) = @_;
        return $org::allbinary::game::displayable::canvas::AllBinaryGameCanvas::TYPE;
}

# use javax::microedition::lcdui::ChoiceGroup;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Item;
# use javax::microedition::lcdui::NullCommandListener;
use org::allbinary::AndroidUtil;
use org::allbinary::J2MEUtil;
use org::allbinary::business::advertisement::GameAdStateFactory;
use org::allbinary::canvas::BaseGameStatistics;
use org::allbinary::canvas::GameStatisticsFactory;
use org::allbinary::canvas::Processor;
use org::allbinary::canvas::RunnableCanvas;
use org::allbinary::debug::DebugFactory;
use org::allbinary::debug::NoDebug;
use org::allbinary::game::GameAdState;
use org::allbinary::game::GameInfo;
use org::allbinary::game::GameStrings;
use org::allbinary::game::GameTypeFactory;
use org::allbinary::game::Intermission;
use org::allbinary::game::IntermissionCompositeInterface;
use org::allbinary::game::IntermissionEnableListenerInterface;
use org::allbinary::game::IntermissionInterface;
use org::allbinary::game::PlayerTypesFactory;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::InGameFeatures;
use org::allbinary::game::configuration::InGameOptionsForm;
use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::game::configuration::event::GameInitializedEvent;
use org::allbinary::game::configuration::event::GameInitializedEventHandler;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::game::configuration::feature::GameFeatureUtil;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::game::configuration::feature::SensorFeatureFactory;
use org::allbinary::game::configuration::feature::TouchFeatureFactory;
use org::allbinary::game::displayable::GameLevelDisplayChangeEventListenersFactory;
use org::allbinary::game::init::BasicBuildGameInitializerFactory;
use org::allbinary::game::init::GameInitializationUtil;
use org::allbinary::game::input::GameInputStrings;
use org::allbinary::game::input::InputProcessor;
use org::allbinary::game::input::NoPlayerGameInput;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::event::GameKeyEventHandler;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::SWTUtil;
use org::allbinary::game::paint::ColorFillBasePaintable;
use org::allbinary::game::paint::ColorFillPaintableFactory;
use org::allbinary::game::resource::ResourceLoadingLevel;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::game::score::HighScore;
use org::allbinary::game::score::HighScoresHelperBaseInterface;
use org::allbinary::game::score::HighScoresFactoryInterface;
use org::allbinary::game::score::HighScoresPaintable;
use org::allbinary::game::score::NullHighScoresSingletonFactory;
use org::allbinary::game::score::displayable::HighScoreTextBox;
use org::allbinary::game::state::GameState;
use org::allbinary::game::state::GameStateFactory;
use org::allbinary::graphics::GraphicsStrings;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::ScreenCapture;
use org::allbinary::graphics::ScreenCaptureFactory;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::displayable::GameTickDisplayInfoSingleton;
use org::allbinary::graphics::displayable::command::MyCommandsFactory;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::displayable::event::DisplayChangeEventHandler;
use org::allbinary::graphics::displayable::event::DisplayChangeEventListener;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::form::CommandCurrentSelectionFormFactory;
use org::allbinary::graphics::form::FormPaintable;
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
use org::allbinary::graphics::paint::NullInitUpdatePaintable;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::image::opengles::OpenGLImageSpecificFactory;
use org::allbinary::input::gyro::SensorGameUpdateProcessor;
use org::allbinary::input::gyro::SingleSensorGameUpdateProcessor;
use org::allbinary::input::motion::button::BaseTouchInput;
use org::allbinary::input::motion::button::NoButtonsTouchInputFactory;
use org::allbinary::input::motion::button::TouchButtonFactory;
use org::allbinary::input::motion::button::TouchButtonsPaintableFactory;
use org::allbinary::input::motion::button::TouchScreenFactory;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::logic::ABSystemWrapper;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::media::audio::AllBinaryMediaManager;
use org::allbinary::media::audio::PlayerQueue;
use org::allbinary::media::audio::PrimaryPlayerQueueFactory;
use org::allbinary::media::audio::SecondaryPlayerQueueFactory;
use org::allbinary::media::audio::SelectSound;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::SecondaryThreadPool;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvasInterface;
use org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface;
use org::allbinary::game::displayable::canvas::MenuListener;
use org::allbinary::game::displayable::canvas::PopupMenuInterface;
use org::allbinary::game::displayable::canvas::GameCanvasRunnable;
use org::allbinary::game::displayable::canvas::GameCanvasPauseRunnable;
use org::allbinary::game::displayable::canvas::FormUtil;
use org::allbinary::game::displayable::canvas::MyFormUtil;
use org::allbinary::game::displayable::canvas::EndGameInfo;
use org::allbinary::game::displayable::canvas::NoMenuInputProcessor;
use org::allbinary::game::displayable::canvas::BaseGameBehavior;
use org::allbinary::game::displayable::canvas::DemoGameBehavior;
use org::allbinary::game::displayable::canvas::BaseMenuBehavior;
use org::allbinary::game::displayable::canvas::InGameMenuBehavior;
use org::allbinary::game::displayable::canvas::BasicPopupMenuPaintable;
use org::allbinary::game::displayable::canvas::PopupMenuInputProcessor;
use org::allbinary::game::displayable::canvas::GameLimitedCommandTextItemArrayFactory;
use org::allbinary::game::displayable::canvas::PopupCommandFormInputProcessor;
use org::allbinary::game::displayable::canvas::NullWaitGameRunnable;
use org::allbinary::game::displayable::canvas::GameProcessor;
use org::allbinary::game::displayable::canvas::CheatGameInputProcessor;
use org::allbinary::game::displayable::canvas::EndGameProcessor;
use org::allbinary::game::displayable::canvas::StartIntermissionProcessor;
use org::allbinary::game::displayable::canvas::EndGamePaintable;
use org::allbinary::game::displayable::canvas::NullDemoPaintable;
use org::allbinary::game::displayable::canvas::GameCanvasInputProcessor;
use org::allbinary::game::displayable::canvas::FormInputProcessor;
use java::lang::Thread;

1;

