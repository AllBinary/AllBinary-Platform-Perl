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

package org::allbinary::game::score::displayable::HighScoresCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::game::displayable::canvas::GameCommandCanvas','org::allbinary::game::score::HighScoresResultsListener';

our $NAME = "HighScoresCanvas";

sub _init_fields {
    my ($self) = @_;
    $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{highScoreCommandsFactory} = 'org::allbinary::game::score::HighScoreCommandsFactory'->getInstance();
    $self->{waitPaintable} = 'org::allbinary::graphics::paint::SimpleTextPaintable'->new($self->{commonStrings}->{PLEASE_WAIT_FOR_SERVER}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
    $self->{highScoresPaintable} = undef;
    $self->{highScoresFactoryInterface} = undef;
    $self->{colorFillPaintable} = undef;
    $self->{highScoresHelper} = 'org::allbinary::game::score::HighScoresHelperBase'->new();
    $self->{gameInfo} = undef;
    $self->{highScoresCanvasInputProcessor} = undef;
    $self->{currentCommand} = $self->{highScoreCommandsFactory}->{HIGH_SCORE_COMMANDS}->[0];
    $self->{hasPainted} = 0;
}


sub new {
    my ($class, $commandListener, $allBinaryGameLayerManager, $gameInfo, $paintable, $highScoresFactoryInterface, $highScoresCanvasInputProcessorFactoryInterface) = @_;
    my $self = $class->SUPER::new($commandListener, $org::allbinary::game::score::displayable::HighScoresCanvas::NAME, $allBinaryGameLayerManager->getBackgroundBasicColor(), $allBinaryGameLayerManager->getForegroundBasicColor());
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{highScoresPaintable} = $paintable;
        $self->{highScoresFactoryInterface} = $highScoresFactoryInterface;
        $self->{highScoresCanvasInputProcessor} = $highScoresCanvasInputProcessorFactoryInterface->getInstance($self);
        $self->{gameInfo} = $gameInfo;
        $self->{waitPaintable}->setBasicColorP($allBinaryGameLayerManager->getForegroundBasicColor());
        $self->getHighScoresPaintable()->setBasicColorP($allBinaryGameLayerManager->getForegroundBasicColor());
        $self->{colorFillPaintable} = 'org::allbinary::game::paint::ColorFillPaintableFactory'->getInstance()->getInstance($allBinaryGameLayerManager->getBackgroundBasicColor(), 0);
        if ($self->{highScoresHelper}->getHighScoresArray() == 'org::allbinary::game::score::NoHighScoresFactory'->getInstance()->{NO_HIGH_SCORES}) {
            $self->setPaintable($self->{waitPaintable});
        } else {
            $self->{logUtil}->putF("Show HighScores that are already loaded", $self, $self->{commonStrings}->{CONSTRUCTOR});
            $self->updateCommand($self->{currentCommand});
            $self->setPaintable($self->getHighScoresPaintable());
        }
        {
        package org::allbinary::game::score::displayable::HighScoreRunnable;
        use strict;
        use warnings;
        use feature 'try';
        no warnings 'experimental::try';
        use Time::HiRes ();
        use parent -norequire,'org::allbinary::thread::ARunnable';
        

        sub _init_fields {
            my ($self) = @_;
            $self->{highScoresCanvas} = undef;
        }
        

        sub new {
            my ($class, $highScoresCanvas) = @_;
            my $self = $class->SUPER::new();
            $self->_init_fields();
                $self->{highScoresCanvas} = $highScoresCanvas;
            return $self;
        }
        

        sub run {
            my ($self) = @_;
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                my $highScoresCanvas = $self->{highScoresCanvas};
                try {
                    my $isHTML = 'org::allbinary::J2MEUtil'->isHTML();
                    if (!$isHTML) {
                        while (!$highScoresCanvas->{hasPainted}) {
                        }
                        $highScoresCanvas->{hasPainted} = 0;
                    }
                    my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
                    my $systemWrapper = 'org::allbinary::logic::ABSystemWrapper'->getInstance();
                    my $currentTimeMillis = $systemWrapper->currentTimeMillis();
                    $logUtil->putF($stringMaker->append("HighScoresCanvas - Request repaint to be sure: ")->appendlong($currentTimeMillis)->toString(), $self, $commonStrings->{RUN});
                    $highScoresCanvas->{repaintBehavior}->onChangeRepaint($highScoresCanvas);
                    if (!$isHTML) {
                        while (!$highScoresCanvas->{hasPainted}) {
                        }
                    }
                    $stringMaker->delete(0, $stringMaker->length());
                    $logUtil->putF($stringMaker->append("HighScoresCanvas - Now that the canvas has completed repaint go ahead and fetch the scores: ")->appendlong($currentTimeMillis)->toString(), $self, $commonStrings->{RUN});
                    $highScoresCanvas->executeUpdate();
                } catch ($e) {
                    $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
                }
        }
        }

        'org::allbinary::thread::SecondaryThreadPool'->getInstance()->runTask('org::allbinary::game::score::displayable::HighScoreRunnable'->new($self));
    return $self;
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->addCommand('org::allbinary::game::commands::GameCommandsFactory'->getInstance()->{CLOSE_AND_SHOW_GAME_CANVAS});
        $self->setCommandListener($cmdListener);
}


sub open {
    my ($self) = @_;
        $self->SUPER::open();
        $self->{highScoresCanvasInputProcessor}->open();
}


# throws Exception
sub close {
    my ($self) = @_;
        $self->SUPER::close();
        $self->{highScoresCanvasInputProcessor}->close();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{colorFillPaintable}->paint($graphics);
        $self->{paintable}->paint($graphics);
        if ($self->{waitPaintable} != $self->{paintable}) {
            $self->{highScoresCanvasInputProcessor}->paint($graphics);
        }
        $self->SUPER::paint($graphics);
        $self->{hasPainted} = 1;
}


sub executeUpdate {
    my ($self) = @_;
        try {
            $self->{highScoresFactoryInterface}->fetchHighScores($self->getGameInfo(), $self);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{UPDATE}, $e);
        }
}


sub getHighScoresPaintable {
    my ($self) = @_;
        return $self->{highScoresPaintable};
}


sub setHighScoresArray {
    my ($self, $highScoresArray) = @_;
        try {
            if (defined($highScoresArray)) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->appendint(scalar(@{$highScoresArray}))->toString(), $self, "setHighScoresArray");
            } else {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "setHighScoresArray");
            }
            $self->{highScoresHelper}->setHighScoresArray($highScoresArray);
            $self->updateCommand($self->{currentCommand});
            $self->setPaintable($self->getHighScoresPaintable());
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{UPDATE}, $e);
        }
}


# throws Exception
sub updateCommand {
    my ($self, $command) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{START})->append($self->{stringUtil}->toString($command))->toString(), $self, $self->{commonStrings}->{UPDATE});
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        if ($self->{highScoreCommandsFactory}->isHighScoreCommand($command)) {
            my $index = $self->{highScoreCommandsFactory}->getIndex($command);
            my $nextIndex = $index + 1;
            my $highScoresArray = $self->{highScoresHelper}->getHighScoresArray();
            if ($nextIndex >= scalar(@{$highScoresArray})) {
                $nextIndex = 0;
            }
            if (scalar(@{$highScoresArray}) > 0) {
                $self->getHighScoresPaintable()->setHighScores($highScoresArray->[$index]);
            } else {
                $self->getHighScoresPaintable()->setHighScores('org::allbinary::game::score::NullHighScoresSingletonFactory'->getInstance());
            }
            if ($index != $nextIndex) {
                $self->removeAllCommands();
                $self->addCommand($gameCommandsFactory->{CLOSE_AND_SHOW_GAME_CANVAS});
                $self->addCommand($self->{highScoreCommandsFactory}->{HIGH_SCORE_COMMANDS}->[$nextIndex]);
            }
        }
        $self->{currentCommand} = $command;
        $self->close();
        $self->SUPER::initMenu();
        $self->open();
        $self->{repaintBehavior}->onChangeRepaint($self);
}


sub getGameInfo {
    my ($self) = @_;
        return $self->{gameInfo};
}


sub setPaintable {
    my ($self, $paintable) = @_;
        $self->{paintable} = $paintable;
        $self->{repaintBehavior}->onChangeRepaint($self);
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::J2MEUtil;
use org::allbinary::game::GameInfo;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::displayable::canvas::GameCommandCanvas;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::paint::ColorFillBasePaintable;
use org::allbinary::game::paint::ColorFillPaintableFactory;
use org::allbinary::game::score::HighScoreCommandsFactory;
use org::allbinary::game::score::HighScores;
use org::allbinary::game::score::HighScoresCanvasInputProcessor;
use org::allbinary::game::score::HighScoresCanvasInputProcessorFactoryInterface;
use org::allbinary::game::score::HighScoresFactoryInterface;
use org::allbinary::game::score::HighScoresHelperBase;
use org::allbinary::game::score::HighScoresPaintable;
use org::allbinary::game::score::HighScoresResultsListener;
use org::allbinary::game::score::NoHighScoresFactory;
use org::allbinary::game::score::NullHighScoresSingletonFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::graphics::paint::SimpleTextPaintable;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::ARunnable;
use org::allbinary::thread::SecondaryThreadPool;
use org::allbinary::logic::ABSystemWrapper;

1;

