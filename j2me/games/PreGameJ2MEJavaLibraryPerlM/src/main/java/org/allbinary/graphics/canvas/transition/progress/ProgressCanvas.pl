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

package org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::RunnableCanvas','org::allbinary::graphics::paint::PaintableInterface','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{hasPainted} = 0;
    $self->{backgroundBasicColor} = undef;
    $self->{GAUGE_PAINTABLE} = 'org::allbinary::graphics::canvas::transition::progress::ProgressPaintable'->new($self);
    $self->{maxValue} = 100.0;
    $self->{gauge} = undef;
    $self->{TEXT} = $self->{commonStrings}->{LOADING};
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{allbinaryMidlet} = 'org::allbinary::midlet::AllBinaryMidlet'->getNullInstance();
    $self->{value} = 0.0;
    $self->{text} = $self->{TEXT};
    $self->{background} = 1;
    $self->{paintable} = $self->{GAUGE_PAINTABLE};
    $self->{inProgress} = 0;
    $self->{IN_GAME_PROCESSOR} = do {
        package org::allbinary::canvas::Processor::AnonymousN67079 { our @ISA = ('org::allbinary::canvas::Processor');
        $self->{pathFindingThreadPool} = 'org::allbinary::thread::PathFindingThreadPool'->getInstance();
        

        # throws Exception
        sub process {
            my ($self) = @_;
            $self->{pathFindingThreadPool}->runAPriorityTask();
        }
        }
        'org::allbinary::canvas::Processor::AnonymousN67079'->can('new') ? 'org::allbinary::canvas::Processor::AnonymousN67079'->new() : bless({}, 'org::allbinary::canvas::Processor::AnonymousN67079')
    };
    $self->{inGameProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{progressEndListener} = $org::allbinary::graphics::canvas::transition::progress::ProgressEndListener::instance;
    $self->{backgroundLabel} = "Background AI Game Loading...";
    $self->{START_BACKGROUND} = "startBackground";
    $self->{ADD_PORTION} = "addPortion";
    $self->{ADD_EARLY_PORTION} = "addEarlyPortion";
}


sub new {
    my ($class, $title, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER, 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{EMPTY_CHILD_NAME_LIST}, 0);
    $self->_init_fields();
        # super(...) made $self above
        $self->{backgroundBasicColor} = $backgroundBasicColor;
        $self->{gauge} = 'org::allbinary::graphics::form::item::ABCustomGaugeItem'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, int($self->{maxValue}), 0, $backgroundBasicColor, $foregroundBasicColor);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{gauge}->setHeight($font->getHeight() + 2);
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub init {
    my ($self, $gameMidlet) = @_;
        $self->{allbinaryMidlet} = $gameMidlet;
}


# throws Exception
sub update {
    my ($self, $graphics) = @_;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
}


sub getMaxValue {
    my ($self) = @_;
        return $self->{maxValue};
}


sub start {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{START_METHOD_NAME});
        $self->setBackground(1);
        $self->{gauge}->setHeight(30);
        $self->{gauge}->setLabel($self->{commonStrings}->{PLEASE_WAIT});
        $self->setText($self->{TEXT});
        $self->setValue(0);
        $self->{inGameProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
        $self->{paintable} = $self->{GAUGE_PAINTABLE};
        $self->{inProgress} = 1;
}


sub startBackground {
    my ($self, $background) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{START_BACKGROUND});
        $self->setBackground($background);
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
        $self->{gauge}->setLabel($self->{backgroundLabel});
        $self->setText($self->{TEXT});
        $self->setValue(0);
        $self->{inGameProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
        $self->{paintable} = $self->{GAUGE_PAINTABLE};
}


sub endActual {
    my ($self) = @_;
        $self->{allbinaryMidlet}->commandAction('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{SHOW_GAME_CANVAS}, $javax::microedition::lcdui::NullCanvas::NULL_CANVAS);
        $self->{inProgress} = 0;
        $self->inGame();
}


sub inGame {
    my ($self) = @_;
        $self->{progressEndListener}->onEndEvent();
        $self->{inGameProcessor} = $self->{IN_GAME_PROCESSOR};
}


sub end {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{END_METHOD_NAME});
        $self->{gauge}->setValue($self->getMaxValue());
        $self->endActual();
        $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}


sub endFromInitialLazyLoadingComplete {
    my ($self) = @_;
        $self->{progressEndListener}->onEndEvent();
        $self->{gauge}->setValue($self->getMaxValue());
        $self->{inGameProcessor} = $self->{IN_GAME_PROCESSOR};
}


sub isInGame {
    my ($self) = @_;
        if ($self->{inGameProcessor} == $self->{IN_GAME_PROCESSOR}) {
            return 1;
        }
        return 0;
}


sub endIfPaintedSinceStart {
    my ($self) = @_;
}


sub addEarlyPortion {
    my ($self, $value, $text, $index) = @_;
        $self->setText('org::allbinary::logic::string::StringMaker'->new()->append($text)->append('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt($index)->toString())->toString());
        $self->{gauge}->setValue($self->{gauge}->getValue() + $self->getMaxValue() / $value);
}


sub addPortion {
    my ($self, $value, $text, $index) = @_;
        $self->setText('org::allbinary::logic::string::StringMaker'->new()->append($text)->append('org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt($index)->toString())->toString());
        'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{text}, $self, $self->{ADD_PORTION});
        $self->{gauge}->setValue($self->{gauge}->getValue() + $self->getMaxValue() / $value);
}


sub addNormalPortion {
    my ($self, $value, $text) = @_;
        if ($self->{text} ne $text) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put($text, $self, $self->{ADD_PORTION});
        }
        $self->setText($text);
        $self->{gauge}->setValue($self->{gauge}->getValue() + $self->getMaxValue() / $value);
}


sub setValue {
    my ($self, $value) = @_;
        $self->{value} = $value;
        $self->{gauge}->setValue($value);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{paintable}->paint($graphics);
}


sub paint2 {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $graphics->setColor(int($self->{backgroundBasicColor}));
        $graphics->fillRect(0, 0, $self->{displayInfo}->getLastWidth(), $self->{displayInfo}->getLastHeight());
        $self->{gauge}->paintXY($graphics, 0, 0);
        $self->{hasPainted} = 1;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


sub getValue {
    my ($self) = @_;
        return $self->{value};
}


sub setText {
    my ($self, $text) = @_;
        $self->{text} = $text;
}


sub getText {
    my ($self) = @_;
        return $self->{text};
}


sub setBackground {
    my ($self, $background) = @_;
        $self->{background} = $background;
}


sub isBackground {
    my ($self) = @_;
        return $self->{background};
}
{
    package org::allbinary::graphics::canvas::transition::progress::ProgressPaintable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::graphics::paint::Paintable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{progressCanvas} = undef;
    }
    

    sub new {
        my ($class, $progressCanvas) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{progressCanvas} = $progressCanvas;
        return $self;
    }
    

    sub paint {
        my ($self, $graphics) = @_;
            $self->{progressCanvas}->paint2($graphics);
    }
    }


# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::NullCanvas;
# use javax::microedition::lcdui::NullCommandListener;
use org::allbinary::canvas::Processor;
use org::allbinary::canvas::RunnableCanvas;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::form::item::ABCustomGaugeItem;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::midlet::AllBinaryMidlet;
use org::allbinary::thread::PathFindingThreadPool;
use org::allbinary::thread::ThreadPool;
use org::allbinary::graphics::canvas::transition::progress::ProgressEndListener;

1;

