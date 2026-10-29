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

package org::allbinary::game::displayable::canvas::GameCommandCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::displayable::MyCanvas','org::allbinary::game::displayable::canvas::MenuListener','org::allbinary::graphics::displayable::event::DisplayChangeEventListener','org::allbinary::graphics::font::UpdateMyFontInterface';

our $id = 0;

sub _init_fields {
    my ($self) = @_;
    $self->{repaintProcessor} = 'org::allbinary::graphics::displayable::screen::ScreenRepaintProcessorFactory'->getInstance()->create($self);
    $self->{gameInputStrings} = 'org::allbinary::game::input::GameInputStrings'->getInstance();
    $self->{foregroundBasicColor} = undef;
    $self->{backgroundBasicColor} = undef;
    $self->{inputToGameKeyMapping} = 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance()->getInputMapping();
    $self->{gameKeyFactory} = 'org::allbinary::game::input::GameKeyFactory'->getInstance();
    $self->{gameKeyEventFactory} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
    $self->{downGameKeyEventHandler} = 'org::allbinary::game::input::event::DownGameKeyEventHandler'->getInstance();
    $self->{upGameKeyEventHandler} = 'org::allbinary::game::input::event::UpGameKeyEventHandler'->getInstance();
    $self->{repaintBehavior} = undef;
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{foregroundColor} = undef;
    $self->{backgroundColor} = undef;
    $self->{menuInputProcessor} = 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->getInstance();
    $self->{menuPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{menuForm} = 'org::allbinary::graphics::form::PaintableForm'->getNullPaintableForm();
    $self->{isSingleKeyRepeatableProcessing} = 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{SINGLE_KEY_REPEAT_PRESS});
    $self->{fontHeight} = 0;
}


sub new {
    my ($class, $cmdListener, $name, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($name, 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{EMPTY_CHILD_NAME_LIST});
    $self->_init_fields();
        # super(...) made $self above
        $self->{repaintBehavior} = 'org::allbinary::game::displayable::RepaintBehavior'->getInstance();
        $self->{foregroundBasicColor} = $foregroundBasicColor;
        $self->{backgroundBasicColor} = $backgroundBasicColor;
        $self->{foregroundColor} = int($self->{foregroundBasicColor});
        $self->{backgroundColor} = int($self->{backgroundBasicColor});
        $self->initCommands($cmdListener);
        if ($cmdListener != $javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER) {
            try {
                $self->initMenu();
                $self->{repaintProcessor}->process();
            } catch ($e) {
                die ("RuntimeException");
            }
        }
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        try {
            my $font = $graphics->getFont();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->append($self->{canvasStrings}->{FD_WIDTH})->appendint(int('org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font)))->append($self->{canvasStrings}->{FD_HEIGHT})->appendint(int($font->getHeight()))->toString(), $self, $self->{canvasStrings}->{UPDATE_MEASUREMENT});
            $self->{fontHeight} = $font->getHeight();
            my $rectangle = $self->createRectangle($self->{menuForm}->size());
            $self->{menuForm}->init($rectangle, 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->{VERTICAL_CENTER_FORM});
            $self->update();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT}, $e);
        }
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->append('org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->toString())->toString(), $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT});
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->addCommand('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->setCommandListener($cmdListener);
}


# throws Exception
sub initMenu {
    my ($self) = @_;
        my $form = $self->createForm();
        $self->{menuForm} = $form;
        if ($form != 'org::allbinary::graphics::form::ScrollSelectionFormNoneFactory'->getInstance()) {
            $self->setMenuInputProcessor('org::allbinary::game::displayable::canvas::ImmediateCommandFormInputProcessor'->new('org::allbinary::util::BasicArrayListD'->new(), -1, $self, $form));
            $self->{menuPaintable} = 'org::allbinary::graphics::form::FormPaintable'->new($form);
        }
        $self->{repaintBehavior}->onChangeRepaint($self);
}


# throws Exception
sub createForm {
    my ($self) = @_;
        my $items = 'org::allbinary::graphics::form::item::CommandTextItemArrayFactory'->new('org::allbinary::graphics::form::item::validation::AllCommandsVisitor'->new())->getInstance($self->getCommandStack(), $self->{backgroundBasicColor}, $self->{foregroundBasicColor});
        my $rectangle = $self->createRectangle(scalar(@{$items}));
        return 'org::allbinary::graphics::form::CommandCurrentSelectionFormFactory'->getInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $items, $rectangle, 'org::allbinary::graphics::form::FormTypeFactory'->getInstance()->{VERTICAL_CENTER_FORM}, 15, 0, $self->{backgroundBasicColor}, $self->{foregroundBasicColor});
}


sub createRectangle {
    my ($self, $size) = @_;
        my $height = $size * $self->{fontHeight};
        my $startY = ($self->{displayInfo}->getLastHeight() * 2 / 3) - $height;
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $rectangle = 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY(30, $startY), $self->{displayInfo}->getLastWidth() - 30, $startY);
        return $rectangle;
}


sub open {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "open");
        'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance()->addListenerInterface($self->getMenuInputProcessor());
        'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->addListener($self->getMenuInputProcessor());
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->addListenerInterface($self);
}


# throws Exception
sub close {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CLOSE});
        'org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler'->getInstance()->removeListener($self->getMenuInputProcessor());
        'org::allbinary::game::input::event::GameKeyEventHandler'->getInstance()->removeListener($self->getMenuInputProcessor());
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->removeListener($self);
}


# throws Exception
sub update {
    my ($self) = @_;
        $self->{repaintProcessor}->process();
}


sub getSourceId {
    my ($self) = @_;
        return $org::allbinary::game::displayable::canvas::GameCommandCanvas::id;
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
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{KEY_PRESSED});
        $self->addGameKeyEvent($keyCode, 0, 0);
}


sub keyReleasedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        $self->removeGameKeyEvent($keyCode, $deviceId, 0);
}


sub keyRepeatedByDevice {
    my ($self, $keyCode, $deviceId) = @_;
        if ($self->{isSingleKeyRepeatableProcessing}) {
            $self->addGameKeyEvent($keyCode, $deviceId, 1);
        }
}


sub addGameKeyEvent {
    my ($self, $keyCode, $deviceId, $repeated) = @_;
        try {
            my $gameKey = $self->{inputToGameKeyMapping}->getInstanceForCanvas($self, $keyCode);
            if ($gameKey != $self->{gameKeyFactory}->{NONE}) {
                my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($self, $gameKey);
                $self->{downGameKeyEventHandler}->fireEvent($gameKeyEvent);
                $self->{downGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
            } else {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{NO_KEY})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{ADD_KEY_EVENT});
            }
        } catch ($e) {
            $self->{logUtil}->put("Key Event Error", $self, $self->{gameInputStrings}->{ADD_KEY_EVENT}, $e);
        }
}


sub removeGameKeyEvent {
    my ($self, $keyCode, $deviceId, $repeated) = @_;
        try {
            my $gameKey = $self->{inputToGameKeyMapping}->getInstanceForCanvas($self, $keyCode);
            if ($gameKey != $self->{gameKeyFactory}->{NONE}) {
                my $gameKeyEvent = $self->{gameKeyEventFactory}->getInstanceForInput($self, $gameKey);
                $self->{upGameKeyEventHandler}->fireEvent($gameKeyEvent);
                $self->{upGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
            } else {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameInputStrings}->{NO_KEY})->appendint($keyCode)->toString(), $self, $self->{gameInputStrings}->{REMOVE_KEY_EVENT});
            }
        } catch ($e) {
            $self->{logUtil}->put("Key Event Error", $self, $self->{gameInputStrings}->{REMOVE_KEY_EVENT}, $e);
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->{menuPaintable}->paint($graphics);
        $self->{repaintBehavior}->repaint($self);
}


sub setMenuInputProcessor {
    my ($self, $menuInputProcessor) = @_;
        $self->{menuInputProcessor} = $menuInputProcessor;
}


sub getMenuInputProcessor {
    my ($self) = @_;
        return $self->{menuInputProcessor};
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::NullCommandListener;
use org::allbinary::canvas::Processor;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::displayable::RepaintBehavior;
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
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::displayable::event::DisplayChangeEventHandler;
use org::allbinary::graphics::displayable::event::DisplayChangeEventListener;
use org::allbinary::graphics::displayable::screen::ScreenRepaintProcessorFactory;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::form::CommandCurrentSelectionFormFactory;
use org::allbinary::graphics::form::FormPaintable;
use org::allbinary::graphics::form::FormTypeFactory;
use org::allbinary::graphics::form::PaintableForm;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::form::ScrollSelectionFormNoneFactory;
use org::allbinary::graphics::form::item::CommandTextItemArrayFactory;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::form::item::validation::AllCommandsVisitor;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::input::motion::gesture::observer::BasicMotionGesturesHandler;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::displayable::canvas::MenuListener;
use org::allbinary::game::displayable::canvas::NoMenuInputProcessor;
use org::allbinary::game::displayable::canvas::ImmediateCommandFormInputProcessor;

1;

