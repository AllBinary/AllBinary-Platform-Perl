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

package org::allbinary::game::midlet::DemoGameMidlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::midlet::GameMidlet';



sub new {
    my ($class, $clientInformationFactory) = @_;
    my $self = $class->SUPER::new($clientInformationFactory);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub isContinue {
    my ($self) = @_;
        my $hashtable = $self->getStartStateHashtable();
        if (defined($hashtable) && $hashtable->size() > 0) {
            return 1;
        } else {
            return 0;
        }
}


sub getHighestLevel {
    my ($self) = @_;
        return 1;
}


# throws Exception
sub createDemoGameCanvasRunnableInterface {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{NOT_IMPLEMENTED}, $self, $self->{commonStrings}->{CREATE});
        return $org::allbinary::game::displayable::canvas::NullGameCanvasRunnable::NULL_GAME_CANVAS_RUNNABLE;
}


# throws Exception
sub createGameCanvasRunnable {
    my ($self, $allBinaryGameLayerManager) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub createGameCanvasRunnableInterface {
    my ($self) = @_;
        return $self->createGameCanvasRunnable($self->createGameLayerManager());
}


sub demoSetup {
    my ($self) = @_;
}


sub postDemoSetup {
    my ($self) = @_;
}


# throws Exception
sub setDemo {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "setDemo");
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->start();
        'org::allbinary::thread::PrimaryThreadPool'->getInstance()->runTask('org::allbinary::game::midlet::DemoRunnable'->new($self));
}


# throws Exception
sub createGame {
    my ($self) = @_;
        my $CREATE_GAME = "createGame";
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $CREATE_GAME);
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->start();
        my $hashtable = $self->getStartStateHashtable();
        $self->setStartStateHashtable('org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE});
        'org::allbinary::thread::PrimaryThreadPool'->getInstance()->runTask('org::allbinary::game::midlet::CreateGameRunnable'->new($self, $hashtable));
        $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $CREATE_GAME);
}


sub isReady {
    my ($self) = @_;
        return 1;
}

use org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::system::security::licensing::ClientInformationFactory;
use org::allbinary::thread::PrimaryThreadPool;
use org::allbinary::game::displayable::canvas::NullGameCanvasRunnable;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::midlet::GameMidlet;
use org::allbinary::game::midlet::DemoRunnable;
use org::allbinary::game::midlet::CreateGameRunnable;

1;

