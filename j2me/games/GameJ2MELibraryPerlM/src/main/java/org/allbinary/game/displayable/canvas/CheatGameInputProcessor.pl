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

package org::allbinary::game::displayable::canvas::CheatGameInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInput';

our $inputProcessor = $org::allbinary::game::layer::special::SpecialGameInputFactory::NO_SPECIAL_GAME_INPUT;

sub _init_fields {
    my ($self) = @_;
    $self->{PROCESS_GAME} = "processGame";
    $self->{gameCanvas} = undef;
    $self->{gameKeyFactory} = 'org::allbinary::game::input::GameKeyFactory'->getInstance();
}


sub new {
    my ($class, $gameCanvas) = @_;
    my $self = $class->SUPER::new('org::allbinary::util::BasicArrayListD'->new(), 'org::allbinary::util::BasicArrayListD'->new(), -1);
    $self->_init_fields();
        # super(...) made $self above
        $self->{gameCanvas} = $gameCanvas;
    return $self;
}


sub update {
    my ($self) = @_;
        try {
            my $gameLayerManager = $self->{gameCanvas}->getLayerManager();
            my $list = $self->getGameKeyEventList();
            my $size = $list->size();
            for (my $index = 0; $index < $size; $index++) {
                my $anyType = $list->{objectArray}->[$index];
                my $key = 'org::allbinary::game::input::event::GameKeyEventUtil'->getKey($anyType);
                if ($key == $self->{gameKeyFactory}->{LEVEL_DOWN}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->strafeLeft();
                    last;
                } elsif ($key == $self->{gameKeyFactory}->{LEVEL_UP}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->strafeRight();
                    last;
                }
                if ($key == $self->{gameKeyFactory}->{LEFT}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->left();
                    last;
                } elsif ($key == $self->{gameKeyFactory}->{RIGHT}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->right();
                    last;
                } elsif ($key == $self->{gameKeyFactory}->{UP}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->up();
                    last;
                } elsif ($key == $self->{gameKeyFactory}->{DOWN}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->down();
                    last;
                } elsif ($key == $self->{gameKeyFactory}->{KEY_NUM1}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->special1($gameLayerManager, $org::allbinary::game::input::event::GameKeyEvent::NONE);
                    last;
                } elsif ($key == $self->{gameKeyFactory}->{KEY_NUM3}->getId()) {
                    $org::allbinary::game::displayable::canvas::CheatGameInputProcessor::inputProcessor->special2($gameLayerManager, $org::allbinary::game::input::event::GameKeyEvent::NONE);
                    last;
                }
            }
            $list->clear();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{UPDATE}, $e);
        }
}

use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::input::event::GameKeyEventUtil;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::special::SpecialGameInputFactory;
use org::allbinary::game::layer::special::SpecialGameInputInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

