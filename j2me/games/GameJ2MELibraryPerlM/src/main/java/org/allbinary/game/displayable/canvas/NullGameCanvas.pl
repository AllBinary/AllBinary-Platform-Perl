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

package org::allbinary::game::displayable::canvas::NullGameCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::AllBinaryGameCanvas';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
our $NO_GAME = "No Background Game";
our $TYPE = 1;

sub _init_fields {
    my ($self) = @_;
    $self->{runningNull} = 1;
}


sub createNull {
    my ($class) = @_;
        try {
            return 'org::allbinary::game::displayable::canvas::NullGameCanvas'->new('org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance());
        } catch ($e) {
            'org::allbinary::logic::communication::log::LogUtil'->getInstance()->put('org::allbinary::string::CommonStrings'->getInstance()->{EXCEPTION}, "NullGameCanvas", 'org::allbinary::string::CommonStrings'->getInstance()->{GET_INSTANCE}, $e);
            die ("RuntimeException");
        }
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::displayable::canvas::NullGameCanvas::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::displayable::canvas::NullGameCanvas::instance = 'org::allbinary::game::displayable::canvas::NullGameCanvas'->createNull();
        }
        return $org::allbinary::game::displayable::canvas::NullGameCanvas::instance;
}


# throws Exception
sub createCanvas {
    my ($class, $gameLayerManager) = @_;
        my $nullGameCanvas = 'org::allbinary::game::displayable::canvas::NullGameCanvas'->new($gameLayerManager);
        $nullGameCanvas->setInitialized(1);
        $nullGameCanvas->setTitle($org::allbinary::game::displayable::canvas::NullGameCanvas::NO_GAME);
        return $nullGameCanvas;
}


sub new {
    my ($class, $gameLayerManager) = @_;
    my $self = $class->SUPER::new($javax::microedition::lcdui::NullCommandListener::NULL_COMMAND_LISTENER, $gameLayerManager, 'org::allbinary::game::score::NoHighScoresFactory'->getInstance(), $org::allbinary::game::init::BasicBuildGameInitializerFactory::NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY, 0);
    $self->_init_fields();
        # super(...) made $self above
        $self->SUPER::setWait(1200);
    return $self;
}


sub isGameOver {
    my ($self) = @_;
        return 0;
}


sub setRunning {
    my ($self, $running) = @_;
        $self->{runningNull} = $running;
}


sub isRunning {
    my ($self) = @_;
        return $self->{runningNull};
}


sub pause {
    my ($self) = @_;
        $self->setPaused(1);
}


sub unPause {
    my ($self) = @_;
        $self->setPaused(0);
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        $self->removeAllCommands();
        $self->setCommandListener($cmdListener);
}


# throws Exception
sub buildGameInit {
    my ($self, $isProgress) = @_;
}


sub draw {
    my ($self, $graphics) = @_;
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
            $self->{logUtil}->putF($self->{commonStrings}->{END_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
        }
}


sub getType {
    my ($self) = @_;
        return $org::allbinary::game::displayable::canvas::NullGameCanvas::TYPE;
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::NullCommandListener;
use org::allbinary::game::init::BasicBuildGameInitializerFactory;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::score::NoHighScoresFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;

1;

